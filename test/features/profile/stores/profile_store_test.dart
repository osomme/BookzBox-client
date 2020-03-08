import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/models/profile_mem_cache.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository.dart';
import 'package:bookzbox/features/profile/repositories/profile_repository_impl.dart';
import 'package:bookzbox/features/profile/services/profile_service.dart';
import 'package:bookzbox/features/profile/stores/profile_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProfileRepo extends Mock implements IProfileRepository {}

class MockProfileService extends Mock implements IProfileService {}

void main() {
  group('Profile store', () {
    var mockProfileRepo = MockProfileRepo();
    var mockProfileService = MockProfileService();

    setUp(() {
      mockProfileRepo = MockProfileRepo();
      mockProfileService = MockProfileService();
    });

    test(
        'When a new profile store is created with null as userId, then it should be marked as my profile.',
        () {
      when(mockProfileRepo.hasCachedProfile()).thenAnswer((_) => false);

      var tmpStore = ProfileStore(mockProfileRepo, null);

      expect(tmpStore.isMyProfile, true);
    });

    test('After fetching my profile, the profile should be cached.', () {
      Profile myProfile = Profile(
        userId: '',
        displayName: 'MY PROFILE',
        rating: 0,
        tradeCount: 0,
        joinDate: DateTime.now(),
        lastSeen: DateTime.now(),
        photoUrl: '',
      );

      when(mockProfileService.fetch(any)).thenAnswer((_) => Future.value(Right(myProfile)));

      var profileRepo = ProfileRepository(ProfileMemCache(), mockProfileService);

      var initialStore = ProfileStore(profileRepo, null);
      initialStore.onProfileLoaded(myProfile); // Profile should be cached here.

      var followUpStore =
          ProfileStore(profileRepo, null); // Profile should be set to the cached version here.

      expect(followUpStore.profile, myProfile);
    });
  });
}
