import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class IStorageService {
  Future<Either<String, String>> uploadFile(File file, String userId);
}
