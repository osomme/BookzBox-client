import 'package:bookzbox/features/box/models/box.dart';
import 'package:bookzbox/features/box/services/box_removal_service.dart';
import 'package:bookzbox/features/box/services/box_updater_service.dart';
import 'package:bookzbox/features/box/services/services.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/new_box/repositories/box_repository_impl.dart';
import 'package:bookzbox/features/new_box/services/publish_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBoxLoaderService extends Mock implements IBoxLoaderService {}

class MockBoxPulishService extends Mock implements IPublishService {}

class MockBoxDetailsService extends Mock implements IBoxDetailsService {}

class MockBoxUpdaterService extends Mock implements IBoxUpdaterService {}

class MockBoxRemovalService extends Mock implements IBoxRemovalService {}

void main() {
  group('Box repository', () {
    var _publishService = MockBoxPulishService();
    var _boxLoaderService = MockBoxLoaderService();
    var _detailsService = MockBoxDetailsService();
    var _updaterService = MockBoxUpdaterService();
    var _removalService = MockBoxRemovalService();

    var repo = BoxRepository(
      _publishService,
      _boxLoaderService,
      _detailsService,
      _updaterService,
      _removalService,
    );

    setUp(() {
      _publishService = MockBoxPulishService();
      _boxLoaderService = MockBoxLoaderService();
      _detailsService = MockBoxDetailsService();
      _updaterService = MockBoxUpdaterService();
      _removalService = MockBoxRemovalService();

      repo = BoxRepository(
        _publishService,
        _boxLoaderService,
        _detailsService,
        _updaterService,
        _removalService,
      );
    });

    test('When publishing box, the publish service should be called once.', () async {
      await repo.publish(boxWithIdOnly);

      verify(_publishService.publish(any)).called(1);
    });

    test('When updating a box, the update service should be called once.', () async {
      await repo.updateStatus(boxWithIdOnly);

      verify(_updaterService.updateStatus(any)).called(1);
    });

    test('When deleting a box, the removal service should be called once.', () async {
      await repo.deleteBox('id');

      verify(_removalService.remove(any)).called(1);
    });

    test('When get box is called, then detail service should be called once.', () async {
      await repo.getBox('box1');

      verify(_detailsService.getBox(any)).called(1);
    });

    /// In this test 'my' refers to the currently authenticated in user.
    test('When fetching my boxes, then box loader should be called once.', () async {
      await repo.fetchUserBoxes('user1');

      verify(_boxLoaderService.loadForUser(any)).called(1);
    });

    test('When fetching boxes for a user, then box loader should be called once.', () async {
      await repo.fetchOtherUsersBoxes('user1');

      verify(_boxLoaderService.loadForOtherUser(any)).called(1);
    });
  });
}

Box boxWithIdOnly = Box(
  id: 'box',
  publisher: null,
  books: null,
  status: null,
  publishDateTime: null,
  latitude: null,
  longitude: null,
  title: null,
  description: null,
);
