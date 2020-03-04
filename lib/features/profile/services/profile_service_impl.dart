import 'package:bookzbox/features/profile/helpers/profile_mapper.dart';
import 'package:bookzbox/features/profile/models/profile.dart';
import 'package:bookzbox/features/profile/services/profile_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ProfileService extends IProfileService {
  final firebase = Firestore.instance;

  @override
  Future<Either<String, Profile>> fetch(String userId) async {
    String error;
    final fetchedProfile = await firebase
        .collection('users')
        .document(userId)
        .get()
        .then((DocumentSnapshot ds) => ProfileMapper.fromFirestore(ds))
        .catchError((err) => error = err);

    if (error != null) {
      // ONLY FOR DEBUGGING
      print('ERROR (profile_service_impl.dart) :: ' + error);
    }

    return (fetchedProfile != null ? right(fetchedProfile) : left(error));
  }
}
