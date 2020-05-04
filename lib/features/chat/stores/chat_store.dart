import 'dart:async';
import 'dart:io';

import 'package:bookzbox/features/activity/activity.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  StreamSubscription<Iterable<ChatMessage>> _streamSubscription;

  ReactionDisposer _reactionDisposer;

  bool _isDisposing = false;

  final ActivityFeedStore _feedStore;

  final IChatRepository _chatRepository;

  final IStorageService _storageService;

  @observable
  bool _isUploadingImage = false;

  @observable
  String _messageInput = '';

  @observable
  bool _isLoadingMessages = false;

  @observable
  bool _isPostingMessage = false;

  @observable
  bool _hasError = false;

  @observable
  List<ChatMessage> _messages = List();

  _ChatStore(this._chatRepository, this._feedStore, this._storageService);

  @computed
  bool get isUploadingImage => _isUploadingImage;

  @computed
  bool get isInputValid => _messageInput.isNotEmpty;

  @computed
  bool get isLoadingMessages => _isLoadingMessages;

  @computed
  bool get isPostingMessage => _isPostingMessage;

  @computed
  bool get hasError => _hasError;

  @computed
  List<ChatMessage> get messages => _messages;

  @action
  void setChatInput(String input) => _messageInput = input.trim();

  @action
  Future<void> loadChatStream(String matchId, String clientUserId) async {
    _isLoadingMessages = true;
    _hasError = false;
    final stream = await _chatRepository.getMessageStream(matchId);
    _streamSubscription = stream.listen(
      (data) {
        if (hasError) {
          _hasError = false;
        }
        _messages = data.toList();
        if (_messages.isNotEmpty && _reactionDisposer == null) {
          // Mark the most recently received message as read.
          _setNewestMessageReadListener(clientUserId, matchId);
        }
      },
      onError: (error) {
        print('Error while listening to chat stream: $error');
        _hasError = true;
      },
    );
    _isLoadingMessages = false;
  }

  void _setNewestMessageReadListener(String clientUserId, String matchId) {
    _reactionDisposer = autorun((reaction) {
      if (_feedStore.chatNotifications.isNotEmpty) {
        _setNewestMessageAsRead(matchId, clientUserId);
      }
      _reactionDisposalCheck(reaction);
    }, delay: 5000);
  }

  void _setNewestMessageAsRead(String matchId, String clientUserId) {
    // Get the first unread message activity item belonging to the current chat.
    try {
      final chatActivityItem = _feedStore.chatNotifications.firstWhere((activity) {
        if (!activity.read && activity.type is MessageActivity) {
          final messageActivtiy = activity.type as MessageActivity;
          return messageActivtiy.chatId == matchId;
        }
        return false;
      });
      print('Marking ${chatActivityItem?.id} as read');

      _feedStore.markAsRead(clientUserId, chatActivityItem.id);
    } on StateError {
      print('[CHAT STORE] Error while attempting to retrieve the first unread message'
          'activity item belonging to current chat with chat id: $matchId');
    }
  }

  void _reactionDisposalCheck(Reaction reaction) {
    if (_isDisposing) {
      reaction.dispose();
    }
  }

  @action
  Future<void> uploadImage(File image, String userId, String matchId) async {
    _isUploadingImage = true;
    final results = await _storageService.uploadFile(image, userId);
    results.fold(
      (error) => print('[CHAT STORE] Image upload failed with: $error'),
      (url) {
        print('[CHAT STORE Uploaded image to: $url');
        _postImageMessage(userId, url, matchId);
      },
    );
    _isUploadingImage = false;
  }

  @action
  Future<void> postTextMessage(String postedByUserId, String matchId) async {
    if (!isInputValid) {
      return;
    }
    final msg = _createMessage(postedByUserId, _messageInput);
    _messageInput = '';
    _isPostingMessage = true;
    final result = await _chatRepository.postMessage(matchId, msg);
    result.fold(
      (error) => _hasError = true,
      (success) => print('[CHAT STORE] Posted message: $_messageInput'),
    );
    _isPostingMessage = false;
  }

  @action
  Future<void> _postImageMessage(
      String postedByUserId, String imageUrl, String matchId) async {
    final msg = _createImageMessage(postedByUserId, imageUrl);
    _isPostingMessage = true;
    final result = await _chatRepository.postMessage(matchId, msg);
    result.fold(
      (error) => _hasError = true,
      (success) => print('[CHAT STORE] Posted image message: ${msg.content}'),
    );
    _isPostingMessage = false;
  }

  ChatMessage _createMessage(String postedByUserId, String message) {
    return ChatMessage(
      postedByUserId: postedByUserId,
      content: message,
      timestamp: DateTime.now(),
      contentType: ChatMessageType.Text,
    );
  }

  ChatMessage _createImageMessage(String postedByUserId, String imageUrl) {
    return ChatMessage(
      postedByUserId: postedByUserId,
      content: imageUrl,
      timestamp: DateTime.now(),
      contentType: ChatMessageType.Image,
    );
  }

  void dispose() {
    _isDisposing = true;
    _streamSubscription?.cancel();
  }
}
