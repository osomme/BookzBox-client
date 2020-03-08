import 'dart:async';

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

  _ChatStore(this._chatRepository, this._feedStore);

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
  Future<void> loadChatStream(String chatId, String clientUserId) async {
    _isLoadingMessages = true;
    _hasError = false;
    final stream = await _chatRepository.getMessageStream(chatId);
    _streamSubscription = stream.listen(
      (data) {
        if (hasError) {
          _hasError = false;
        }
        _messages = data.toList();
        if (_messages.isNotEmpty && _reactionDisposer == null) {
          // Mark the most recently received message as read.
          _setNewestMessageReadListener(clientUserId, chatId);
        }
      },
      onError: (error) {
        print('Error while listening to chat stream: $error');
        _hasError = true;
      },
    );
    _isLoadingMessages = false;
  }

  void _setNewestMessageReadListener(String clientUserId, String chatId) {
    _reactionDisposer = autorun((reaction) {
      if (_feedStore.chatNotifications.isNotEmpty) {
        _setNewestMessageAsRead(chatId, clientUserId);
      }
      _reactionDisposalCheck(reaction);
    }, delay: 5000);
  }

  void _setNewestMessageAsRead(String chatId, String clientUserId) {
    // Get the first unread message activity item belonging to the current chat.
    try {
      final chatActivityItem = _feedStore.chatNotifications.firstWhere((activity) {
        if (!activity.read && activity.type is MessageActivity) {
          final messageActivtiy = activity.type as MessageActivity;
          return messageActivtiy.chatId == chatId;
        }
        return false;
      });

      _feedStore.markAsRead(clientUserId, chatActivityItem.id);
    } on StateError {
      print('[CHAT STORE] Error while attempting to retrieve the first unread message'
          'activity item belonging to current chat with chat id: $chatId');
    }
  }

  void _reactionDisposalCheck(Reaction reaction) {
    if (_isDisposing) {
      reaction.dispose();
    }
  }

  @action
  Future<void> postMessage(String postedByUserId, String chatId) async {
    if (!isInputValid) {
      return;
    }
    final msg = _createMessage(postedByUserId, _messageInput);
    _messageInput = '';
    _isPostingMessage = true;
    final result = await _chatRepository.postMessage(chatId, msg);
    result.fold(
      (success) => print('Posted message: $_messageInput'),
      (error) => _hasError = true,
    );
    _isPostingMessage = false;
  }

  ChatMessage _createMessage(String postedByUserId, String message) {
    return ChatMessage(
      postedByUserId: postedByUserId,
      content: message,
      timestamp: DateTime.now(),
    );
  }

  void dispose() {
    _isDisposing = true;
    _streamSubscription?.cancel();
  }
}
