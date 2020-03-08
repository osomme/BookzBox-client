import 'dart:async';

import 'package:bookzbox/features/chat/chat.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  StreamSubscription<Iterable<ChatMessage>> _streamSubscription;

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

  _ChatStore(this._chatRepository);

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
  Future<void> loadChatStream(String chatId) async {
    _isLoadingMessages = true;
    _hasError = false;
    final stream = await _chatRepository.getMessageStream(chatId);
    _streamSubscription = stream.listen(
      (data) {
        if (hasError) {
          _hasError = false;
        }
        print('[CHAT STORE] Stream messsage received with length: ${data.length}');
        _messages = data.toList();
      },
      onError: (error) {
        print('Error while listening to chat stream: $error');
        _hasError = true;
      },
    );
    _isLoadingMessages = false;
  }

  @action
  Future<void> postMessage(String postedByUserId, String chatId) async {
    if (!isInputValid) {
      return;
    }
    final msg = _createMessage(postedByUserId, _messageInput);
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

  void dispose() => _streamSubscription?.cancel();
}
