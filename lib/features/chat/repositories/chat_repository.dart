import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:dartz/dartz.dart';

/// Repository methods for fetching and posting chat messages.
abstract class IChatRepository {
  /// Returns a stream of chat messages for a particular chat.
  ///
  /// [chatId] The ID of the chat whose stream is being loaded.
  Future<Stream<Iterable<ChatMessage>>> getMessageStream(String chatId);

  /// Posts a message to a chat.
  ///
  /// [chatId] The ID of the chat that the message is being posted to.
  /// [message] The message that is being posted.
  Future<Either<NetworkError, bool>> postMessage(String chatId, ChatMessage message);
}
