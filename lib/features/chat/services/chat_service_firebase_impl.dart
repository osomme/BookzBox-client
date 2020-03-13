import 'package:bookzbox/common/errors/error_types.dart';
import 'package:bookzbox/features/chat/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseChatService implements IChatService {
  final _firestore = Firestore.instance;

  @override
  Future<Stream<Iterable<ChatMessage>>> getMessageStream(String chatId) async {
    return _firestore
        .collection('matches')
        .document(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snap) => snap.documents.map((doc) => ChatMessage.fromFirebase(doc)));
  }

  @override
  Future<Either<NetworkError, bool>> postMessage(
      String chatId, ChatMessage message) async {
    try {
      await _firestore.collection('matches').document(chatId).collection('messages').add({
        'postedByUserId': message.postedByUserId,
        'content': message.content,
        'timestamp': message.timestamp,
        'contentType': message.contentType.index,
      });
      return right(true);
    } catch (e) {
      print('Error while attempting to post chat message in chat $chatId. Error: $e');
      return left(NetworkError.noInternet);
    }
  }
}
