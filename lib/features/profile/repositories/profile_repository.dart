import 'package:bookzbox/features/profile/models/profile.dart';

abstract class IProfileRepository {
  bool hasCachedProfile();

  Profile getCachedProfile();
}
