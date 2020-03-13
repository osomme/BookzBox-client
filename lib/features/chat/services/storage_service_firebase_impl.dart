import 'dart:io';

import 'package:bookzbox/features/chat/chat.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageService implements IStorageService {
  final _storageRef = FirebaseStorage.instance.ref();

  @override
  Future<Either<String, String>> uploadFile(File file, String userId) async {
    if (userId == null) {
      return left('[ERROR: Storage service] User ID cannot be null');
    } else if (file == null) {
      return left('[ERROR: Storage service] File was null');
    }
    final photoName = Uuid().v4();
    final uploadTask = _storageRef.child('$userId/chat_images/$photoName').putFile(file);
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error != null) {
      print('[UPLOAD SERVICE] Finished uploading, error code: ${snapshot.error}');
      return left('Error while attempting to upload image');
    }
    final url = await snapshot.ref.getDownloadURL();
    return right(url);
  }
}
