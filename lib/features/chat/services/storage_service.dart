import 'dart:io';

import 'package:dartz/dartz.dart';

/// Service which provides methods for uploading files to a remove storage service.
abstract class IStorageService {
  /// Uploads a file to a webservice.
  ///
  /// [file] The file that is being uploaded.
  /// [userId] The user ID of the user that is uploading the file.
  Future<Either<String, String>> uploadFile(File file, String userId);
}
