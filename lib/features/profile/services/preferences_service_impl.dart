import 'package:bookzbox/features/profile/helpers/book_subject_mapper.dart';
import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:bookzbox/features/profile/services/preferences_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PreferencesService extends IPreferencesService {
  final Firestore firestore = Firestore.instance;

  @override
  Future<bool> setFavoriteGenre(String userId, List<BookSubject> genres) async {
    bool success = false;

    await firestore
        .collection('users')
        .document(userId)
        .updateData(BookSubjectMapper.toFirestore(genres))
        .then((_) => success = true)
        .catchError((err) => success = false);

    if (!success) {
      print("ERROR::PreferencesService.setFavoriteGenre");
    }
    return success;
  }
}
