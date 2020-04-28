import 'package:bookzbox/features/profile/models/book_subjects.dart';

abstract class IPreferencesRepository {
  /// Sets/ updates the users favorite book genres.
  ///
  /// Returns `true` if the genres where successfully updated; otherwise `false`.
  Future<bool> setFavoriteGenre(String userId, List<BookSubject> genres);
}
