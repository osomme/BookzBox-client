import 'package:bookzbox/features/profile/models/book_subjects.dart';

abstract class IPreferencesService {
  Future<bool> setFavoriteGenre(String userId, List<BookSubject> genres);
}
