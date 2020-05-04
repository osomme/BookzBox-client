// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  Computed<bool> _$isUploadingImageComputed;

  @override
  bool get isUploadingImage => (_$isUploadingImageComputed ??=
          Computed<bool>(() => super.isUploadingImage))
      .value;
  Computed<bool> _$isInputValidComputed;

  @override
  bool get isInputValid =>
      (_$isInputValidComputed ??= Computed<bool>(() => super.isInputValid))
          .value;
  Computed<bool> _$isLoadingMessagesComputed;

  @override
  bool get isLoadingMessages => (_$isLoadingMessagesComputed ??=
          Computed<bool>(() => super.isLoadingMessages))
      .value;
  Computed<bool> _$isPostingMessageComputed;

  @override
  bool get isPostingMessage => (_$isPostingMessageComputed ??=
          Computed<bool>(() => super.isPostingMessage))
      .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError)).value;
  Computed<List<ChatMessage>> _$messagesComputed;

  @override
  List<ChatMessage> get messages =>
      (_$messagesComputed ??= Computed<List<ChatMessage>>(() => super.messages))
          .value;

  final _$_isUploadingImageAtom = Atom(name: '_ChatStore._isUploadingImage');

  @override
  bool get _isUploadingImage {
    _$_isUploadingImageAtom.context.enforceReadPolicy(_$_isUploadingImageAtom);
    _$_isUploadingImageAtom.reportObserved();
    return super._isUploadingImage;
  }

  @override
  set _isUploadingImage(bool value) {
    _$_isUploadingImageAtom.context.conditionallyRunInAction(() {
      super._isUploadingImage = value;
      _$_isUploadingImageAtom.reportChanged();
    }, _$_isUploadingImageAtom, name: '${_$_isUploadingImageAtom.name}_set');
  }

  final _$_messageInputAtom = Atom(name: '_ChatStore._messageInput');

  @override
  String get _messageInput {
    _$_messageInputAtom.context.enforceReadPolicy(_$_messageInputAtom);
    _$_messageInputAtom.reportObserved();
    return super._messageInput;
  }

  @override
  set _messageInput(String value) {
    _$_messageInputAtom.context.conditionallyRunInAction(() {
      super._messageInput = value;
      _$_messageInputAtom.reportChanged();
    }, _$_messageInputAtom, name: '${_$_messageInputAtom.name}_set');
  }

  final _$_isLoadingMessagesAtom = Atom(name: '_ChatStore._isLoadingMessages');

  @override
  bool get _isLoadingMessages {
    _$_isLoadingMessagesAtom.context
        .enforceReadPolicy(_$_isLoadingMessagesAtom);
    _$_isLoadingMessagesAtom.reportObserved();
    return super._isLoadingMessages;
  }

  @override
  set _isLoadingMessages(bool value) {
    _$_isLoadingMessagesAtom.context.conditionallyRunInAction(() {
      super._isLoadingMessages = value;
      _$_isLoadingMessagesAtom.reportChanged();
    }, _$_isLoadingMessagesAtom, name: '${_$_isLoadingMessagesAtom.name}_set');
  }

  final _$_isPostingMessageAtom = Atom(name: '_ChatStore._isPostingMessage');

  @override
  bool get _isPostingMessage {
    _$_isPostingMessageAtom.context.enforceReadPolicy(_$_isPostingMessageAtom);
    _$_isPostingMessageAtom.reportObserved();
    return super._isPostingMessage;
  }

  @override
  set _isPostingMessage(bool value) {
    _$_isPostingMessageAtom.context.conditionallyRunInAction(() {
      super._isPostingMessage = value;
      _$_isPostingMessageAtom.reportChanged();
    }, _$_isPostingMessageAtom, name: '${_$_isPostingMessageAtom.name}_set');
  }

  final _$_hasErrorAtom = Atom(name: '_ChatStore._hasError');

  @override
  bool get _hasError {
    _$_hasErrorAtom.context.enforceReadPolicy(_$_hasErrorAtom);
    _$_hasErrorAtom.reportObserved();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.context.conditionallyRunInAction(() {
      super._hasError = value;
      _$_hasErrorAtom.reportChanged();
    }, _$_hasErrorAtom, name: '${_$_hasErrorAtom.name}_set');
  }

  final _$_messagesAtom = Atom(name: '_ChatStore._messages');

  @override
  List<ChatMessage> get _messages {
    _$_messagesAtom.context.enforceReadPolicy(_$_messagesAtom);
    _$_messagesAtom.reportObserved();
    return super._messages;
  }

  @override
  set _messages(List<ChatMessage> value) {
    _$_messagesAtom.context.conditionallyRunInAction(() {
      super._messages = value;
      _$_messagesAtom.reportChanged();
    }, _$_messagesAtom, name: '${_$_messagesAtom.name}_set');
  }

  final _$loadChatStreamAsyncAction = AsyncAction('loadChatStream');

  @override
  Future<void> loadChatStream(String matchId, String clientUserId) {
    return _$loadChatStreamAsyncAction
        .run(() => super.loadChatStream(matchId, clientUserId));
  }

  final _$uploadImageAsyncAction = AsyncAction('uploadImage');

  @override
  Future<void> uploadImage(File image, String userId, String matchId) {
    return _$uploadImageAsyncAction
        .run(() => super.uploadImage(image, userId, matchId));
  }

  final _$postTextMessageAsyncAction = AsyncAction('postTextMessage');

  @override
  Future<void> postTextMessage(String postedByUserId, String matchId) {
    return _$postTextMessageAsyncAction
        .run(() => super.postTextMessage(postedByUserId, matchId));
  }

  final _$_postImageMessageAsyncAction = AsyncAction('_postImageMessage');

  @override
  Future<void> _postImageMessage(
      String postedByUserId, String imageUrl, String matchId) {
    return _$_postImageMessageAsyncAction
        .run(() => super._postImageMessage(postedByUserId, imageUrl, matchId));
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  void setChatInput(String input) {
    final _$actionInfo = _$_ChatStoreActionController.startAction();
    try {
      return super.setChatInput(input);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }
}
