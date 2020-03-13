import 'package:bookzbox/features/profile/models/book_subjects.dart';

abstract class IPreferencesRepository {
  /// Sets/ update the users favorite book genres.
  Future<bool> setFavoriteGenre(String userId, List<BookSubject> genres);
}
