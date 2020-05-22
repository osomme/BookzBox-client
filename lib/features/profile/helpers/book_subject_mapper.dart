import 'dart:convert';

import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:dartz/dartz.dart';

class BookSubjectMapper {
  /// Converts a list of book subjects into a JSON format supported
  /// by Firestore.
  ///
  /// [subjects] A list if `BookSubject` to convert.
  /// Returns a `Map` with the given subjects formatted correctly for
  /// Firestore.
  static Map<String, dynamic> toFirestore(List<BookSubject> subjects) {
    Map<String, dynamic> map = Map();

    var json = jsonEncode(toIndex(subjects));
    map.putIfAbsent('favoriteGenres', () => json);

    print("Setting following preferences (JSON): " + map.toString());

    return map;
  }

  /// Converts a list of book subjects into a list containing
  /// the index represented by each subject.
  ///
  /// [subjects] The list of `BookSubject` that should be converted.
  /// Returns a list of indices.
  static List<int> toIndex(List<BookSubject> subjects) {
    List<int> indices = List();
    subjects.forEach((subject) => indices.add(subject.index));
    return indices;
  }

  /// Create a list of `BookSubject`s from Firestore [data].
  static List<BookSubject> fromFirestore(Map<String, dynamic> data) {
    List<BookSubject> result;
    var dataString = (data['favoriteGenres'] as String);
    if (dataString == null || dataString.isEmpty) {
      return List();
    }
    String indicesJson = dataString.trim();
    if (indicesJson.length <= 2) {
      // The string is just the array brackets.
      return List();
    }
    List<String> indices =
        indicesJson.substring(1, indicesJson.length - 1).split(','); //Remove brackets and split
    try {
      result = fromIndex(indices);
    } on FormatException {
      print('Format error with indices: ' + indices.toString());
    }
    return result;
  }

  static List<BookSubject> fromMap(Map<String, int> subjectMap) {
    List<BookSubject> subjectList = List();

    subjectMap.forEach((k, v) => subjectList.add(BookSubject.values[v]));

    return subjectList;
  }

  static List<BookSubject> fromIndex(List<String> subjectIndices) {
    List<BookSubject> subjectList = List();

    subjectIndices.forEach((i) => subjectList.add(BookSubject.values[int.parse(i)]));

    return subjectList;
  }

  /// Get the approtiate string representation for the given [subject].
  /// This is not a localized string and is not meant for UI.
  static Tuple2<String, int> getKV(BookSubject subject) {
    switch (subject) {
      case BookSubject.Action:
        return Tuple2('Action', subject.index);

      case BookSubject.Adventure:
        return Tuple2('Adventure', subject.index);

      case BookSubject.Anthology:
        return Tuple2('Anthology', subject.index);

      case BookSubject.Children:
        return Tuple2('Children', subject.index);

      case BookSubject.Comic:
        return Tuple2('Comic', subject.index);

      case BookSubject.ComingOfAge:
        return Tuple2('ComingOfAge', subject.index);

      case BookSubject.Crime:
        return Tuple2('Crime', subject.index);

      case BookSubject.Drama:
        return Tuple2('Drama', subject.index);

      case BookSubject.Fairytale:
        return Tuple2('Fairytale', subject.index);

      case BookSubject.GraphicNovel:
        return Tuple2('GraphicNovel', subject.index);

      case BookSubject.HistoricalFiction:
        return Tuple2('HistoricalFiction', subject.index);

      case BookSubject.Horror:
        return Tuple2('Horror', subject.index);

      case BookSubject.Mystery:
        return Tuple2('Mystery', subject.index);

      case BookSubject.Paranormal:
        return Tuple2('Paranormal', subject.index);

      case BookSubject.PictureBook:
        return Tuple2('PictureBook', subject.index);

      case BookSubject.Poetry:
        return Tuple2('Poetry', subject.index);

      case BookSubject.PoliticalThriller:
        return Tuple2('PoliticalThriller', subject.index);

      case BookSubject.Romance:
        return Tuple2('Romance', subject.index);

      case BookSubject.Satire:
        return Tuple2('Satire', subject.index);

      case BookSubject.ScienceFiction:
        return Tuple2('ScienceFiction', subject.index);

      case BookSubject.ShortStory:
        return Tuple2('ShortStory', subject.index);

      case BookSubject.Suspense:
        return Tuple2('Suspense', subject.index);

      case BookSubject.Thriller:
        return Tuple2('Thriller', subject.index);

      case BookSubject.YoungAdult:
        return Tuple2('YoungAdult', subject.index);

      case BookSubject.Art:
        return Tuple2('Art', subject.index);

      case BookSubject.Autobiography:
        return Tuple2('Autobiography', subject.index);

      case BookSubject.Biography:
        return Tuple2('Biography', subject.index);

      case BookSubject.Cookbook:
        return Tuple2('Cookbook', subject.index);

      case BookSubject.Diary:
        return Tuple2('Diary', subject.index);

      case BookSubject.Dictionary:
        return Tuple2('Dictionary', subject.index);

      case BookSubject.Encyclopedia:
        return Tuple2('Encyclopedia', subject.index);

      case BookSubject.Educational:
        return Tuple2('Educational', subject.index);

      case BookSubject.Women:
        return Tuple2('Women', subject.index);

      case BookSubject.Guide:
        return Tuple2('Guide', subject.index);

      case BookSubject.Health:
        return Tuple2('Health', subject.index);

      case BookSubject.History:
        return Tuple2('History', subject.index);

      case BookSubject.Journal:
        return Tuple2('Journal', subject.index);

      case BookSubject.Math:
        return Tuple2('Math', subject.index);

      case BookSubject.Memoir:
        return Tuple2('Memoir', subject.index);

      case BookSubject.Prayer:
        return Tuple2('Prayer', subject.index);

      case BookSubject.Religion:
        return Tuple2('Religion', subject.index);

      case BookSubject.Textbook:
        return Tuple2('Textbook', subject.index);

      case BookSubject.Science:
        return Tuple2('Science', subject.index);

      case BookSubject.Selfhelp:
        return Tuple2('Selfhelp', subject.index);

      case BookSubject.Travel:
        return Tuple2('Travel', subject.index);

      case BookSubject.TrueCrime:
        return Tuple2('TrueCrime', subject.index);

      case BookSubject.Classic:
        return Tuple2('Classic', subject.index);

      case BookSubject.Humor:
        return Tuple2('Humor', subject.index);

      case BookSubject.Mythology:
        return Tuple2('Mythology', subject.index);

      case BookSubject.Fiction:
        return Tuple2('Fiction', subject.index);

      default:
        throw RangeError('Invalid BookSubject received.');
    }
  }
}
