import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl implements IChatRepository {
  final IChatService _service;

  ChatRepositoryImpl(this._service);

  @override
  Future<Stream<Iterable<ChatMessage>>> getMessageStream(String chatId) =>
      _service.getMessageStream(chatId);

  @override
  Future<Either<NetworkError, bool>> postMessage(String chatId, ChatMessage message) =>
      _service.postMessage(chatId, message);
}
