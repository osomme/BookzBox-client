import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:mobx/mobx.dart';

part 'preferences_store.g.dart';

class PreferencesStore = _PreferencesStore with _$PreferencesStore;

abstract class _PreferencesStore with Store {
  @observable
  ObservableList<BookSubject> favoriteBookSubjects = new ObservableList();

  @observable
  BookSubject _selectedSubject;

  @action
  void setSelectedSubject(BookSubject subject) => _selectedSubject = subject;

  @computed
  BookSubject get selectedSubject => _selectedSubject;

  @action
  Future addBookSubject(BookSubject subject) async {
    if (favoriteBookSubjects.contains(subject)) {
      return;
    }
    favoriteBookSubjects.add(subject);
    // TODO: add to DB
  }

  @action
  Future removeBookSubject(BookSubject subject) async {
    if (!favoriteBookSubjects.contains(subject)) {
      return;
    }
    favoriteBookSubjects.remove(subject);
    // TODO: remove from DB
  }
}
