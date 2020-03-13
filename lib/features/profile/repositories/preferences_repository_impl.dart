import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:bookzbox/features/profile/repositories/preferences_repository.dart';
import 'package:bookzbox/features/profile/services/preferences_service.dart';

class PreferencesRepository extends IPreferencesRepository {
  final IPreferencesService _service;

  PreferencesRepository(this._service);

  @override
  Future<bool> setFavoriteGenre(String userId, List<BookSubject> genres) async {
    return _service.setFavoriteGenre(userId, genres);
  }
}
