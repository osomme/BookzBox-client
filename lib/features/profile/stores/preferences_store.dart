import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:bookzbox/features/profile/repositories/preferences_repository.dart';
import 'package:mobx/mobx.dart';

part 'preferences_store.g.dart';

class PreferencesStore = _PreferencesStore with _$PreferencesStore;

abstract class _PreferencesStore with Store {
  final IPreferencesRepository _preferencesRepo;

  @observable
  ObservableList<BookSubject> favoriteBookSubjects = new ObservableList();

  @observable
  BookSubject _selectedSubject;

  _PreferencesStore(this._preferencesRepo);

  @action
  void setSelectedSubject(BookSubject subject) => _selectedSubject = subject;

  @computed
  BookSubject get selectedSubject => _selectedSubject;

  /// Adds a book subject to the user with the passed id,
  /// but only if it is not already added.
  @action
  Future addBookSubject(String userId, BookSubject subject) async {
    if (favoriteBookSubjects.contains(subject)) {
      return;
    }
    favoriteBookSubjects.add(subject);
    await _preferencesRepo.setFavoriteGenre(userId, favoriteBookSubjects.toList());
  }

  /// Removes a book subject.
  /// If the passed subject does not exist, then nothing is done.
  @action
  Future removeBookSubject(String userId, BookSubject subject) async {
    if (!favoriteBookSubjects.contains(subject)) {
      return;
    }
    favoriteBookSubjects.remove(subject);
    await _preferencesRepo.setFavoriteGenre(userId, favoriteBookSubjects.toList());
  }
}
