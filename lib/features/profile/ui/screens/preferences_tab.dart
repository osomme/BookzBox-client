import 'package:bookzbox/common/widgets/keys.dart';
import 'package:bookzbox/features/profile/models/book_subjects.dart';
import 'package:bookzbox/features/profile/stores/preferences_store.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

/// Represents the user preferences tab on the profile page
class PreferencesTab extends StatelessWidget {
  final ProfileStore profileStore;
  final PreferencesStore preferencesStore;

  PreferencesTab({
    Key key,
    @required this.profileStore,
    @required this.preferencesStore,
  }) : super(key: key);

  Map<BookSubject, String> getBookSubjects(BuildContext context) {
    return {
      BookSubject.Action: S.of(context).bookSubjectAction,
      BookSubject.Adventure: S.of(context).bookSubjectAdventure,
      BookSubject.Anthology: S.of(context).bookSubjectAnthology,
      BookSubject.Children: S.of(context).bookSubjectChildren,
      BookSubject.Comic: S.of(context).bookSubjectComic,
      BookSubject.ComingOfAge: S.of(context).bookSubjectComingOfAge,
      BookSubject.Crime: S.of(context).bookSubjectCrime,
      BookSubject.Drama: S.of(context).bookSubjectDrama,
      BookSubject.Fairytale: S.of(context).bookSubjectFairytale,
      BookSubject.GraphicNovel: S.of(context).bookSubjectGraphicNovel,
      BookSubject.HistoricalFiction: S.of(context).bookSubjectHistFict,
      BookSubject.Horror: S.of(context).bookSubjectHorror,
      BookSubject.Mystery: S.of(context).bookSubjectMystery,
      BookSubject.Paranormal: S.of(context).bookSubjectParanormal,
      BookSubject.PictureBook: S.of(context).bookSubjectPictureBook,
      BookSubject.Poetry: S.of(context).bookSubjectPoetry,
      BookSubject.PoliticalThriller: S.of(context).bookSubjectPoliticalThriller,
      BookSubject.Romance: S.of(context).bookSubjectRomance,
      BookSubject.Satire: S.of(context).bookSubjectSatire,
      BookSubject.ScienceFiction: S.of(context).bookSubjectSciFi,
      BookSubject.ShortStory: S.of(context).bookSubjectShortStory,
      BookSubject.Suspense: S.of(context).bookSubjectSuspense,
      BookSubject.Thriller: S.of(context).bookSubjectThriller,
      BookSubject.YoungAdult: S.of(context).bookSubjectYoungAdult,
      BookSubject.Art: S.of(context).bookSubjectArt,
      BookSubject.Autobiography: S.of(context).bookSubjectAutobiography,
      BookSubject.Biography: S.of(context).bookSubjectBiography,
      BookSubject.Cookbook: S.of(context).bookSubjectCookbook,
      BookSubject.Diary: S.of(context).bookSubjectDiary,
      BookSubject.Dictionary: S.of(context).bookSubjectDictionary,
      BookSubject.Encyclopedia: S.of(context).bookSubjectEncyclopedia,
      BookSubject.Educational: S.of(context).bookSubjectEducational,
      BookSubject.Women: S.of(context).bookSubjectWomen,
      BookSubject.Guide: S.of(context).bookSubjectGuide,
      BookSubject.Health: S.of(context).bookSubjectHealth,
      BookSubject.History: S.of(context).bookSubjectHistory,
      BookSubject.Journal: S.of(context).bookSubjectJournal,
      BookSubject.Math: S.of(context).bookSubjectMath,
      BookSubject.Memoir: S.of(context).bookSubjectMemoir,
      BookSubject.Prayer: S.of(context).bookSubjectPrayer,
      BookSubject.Religion: S.of(context).bookSubjectReligion,
      BookSubject.Textbook: S.of(context).bookSubjectTextbook,
      BookSubject.Science: S.of(context).bookSubjectScience,
      BookSubject.Selfhelp: S.of(context).bookSubjectSelfhelp,
      BookSubject.Travel: S.of(context).bookSubjectTravel,
      BookSubject.TrueCrime: S.of(context).bookSubjectTrueCrime,
      BookSubject.Classic: S.of(context).bookSubjectClassic,
      BookSubject.Humor: S.of(context).bookSubjectHumor,
      BookSubject.Mythology: S.of(context).bookSubjectMythology,
      BookSubject.Fiction: S.of(context).bookSubjectFiction,
    };
  }

  List<DropdownMenuItem> getBookSubjectsMenuItems(BuildContext context) {
    List<DropdownMenuItem> menuItems = new List();

    getBookSubjects(context).forEach((subjectEnum, subjectString) {
      menuItems.add(DropdownMenuItem(
        child: Text(subjectString),
        value: subjectEnum,
      ));
    });

    menuItems.sort((a, b) => (a.child as Text).data.compareTo((b.child as Text).data));
    return menuItems;
  }

  /// Generate chips for each passed book subject.
  /// The chips are sorted alphabetically based on chip label.
  List<Chip> _genGenreChips(BuildContext context, List<BookSubject> subjects) {
    List<Chip> chips = List();
    final subjectStrings = getBookSubjects(context);

    for (int i = 0; i < subjects.length; i++) {
      BookSubject subject = subjects[i];
      chips.add(Chip(
        key: Key(Keys.bookPreferenceChipKey + i.toString()),
        elevation: 8,
        backgroundColor: Theme.of(context).accentColor,
        label: Text(subjectStrings[subject]),
        deleteIcon: Icon(
          MaterialIcons.close,
        ),
        deleteButtonTooltipMessage: S.of(context).preferencesRemoveGenreTip,
        onDeleted: () => preferencesStore.removeBookSubject(profileStore.profile.userId, subject),
      ));
    }
    chips.sort((a, b) => (a.label as Text).data.compareTo((b.label as Text).data));
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    if (preferencesStore.favoriteBookSubjects.isEmpty) {
      preferencesStore.favoriteBookSubjects.addAll(profileStore.profile.favoriteGenres);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 2.0, top: 16.0, right: 16.0, left: 16.0),
          child: Text(
            S.of(context).preferencesFavoriteGenreTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0, right: 16.0, left: 16.0),
          child: Text(
            S.of(context).preferencesFavoriteGenreInfo,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          child: Observer(
            builder: (_) => Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _genGenreChips(context, preferencesStore.favoriteBookSubjects),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            right: 16.0,
            left: 16.0,
          ),
          padding: const EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: 8,
            right: 8,
          ),
          child: Observer(
            builder: (_) => SearchableDropdown.single(
              style: TextStyle(color: Colors.black),
              dialogBox: true,
              items: getBookSubjectsMenuItems(context),
              value: preferencesStore.selectedSubject,
              hint: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  bottom: 12,
                ),
                child: Text(
                  S.of(context).preferencesGenreHint,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              searchHint: S.of(context).preferencesGenreSearchHint,
              onChanged: (value) {
                preferencesStore.setSelectedSubject(value);
                if (value != null) {
                  preferencesStore.addBookSubject(profileStore.profile.userId, value);
                }
              },
              isExpanded: true,
              underline: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
