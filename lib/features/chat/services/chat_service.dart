import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:dartz/dartz.dart';

abstract class IChatService {
  Future<Stream<Iterable<ChatMessage>>> getMessageStream(String chatId);

  Future<Either<NetworkError, bool>> postMessage(String chatId, ChatMessage message);
}
