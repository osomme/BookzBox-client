import 'package:bookzbox/features/map/box_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BoxMapFirebaseService implements IMapBoxService {
  final _firestore = Firestore.instance;

  @override
  Future<Either<MapError, List<BoxMapItem>>> getAllBoxes() async {
    try {
      final boxes = await _firestore.collection('boxes').getDocuments().then(
          (docs) => docs.documents.map((b) => BoxMapItem.fromFirestore(b)).toList());

      return right(boxes);
    } catch (e) {
      print(e);
      return left(MapError.boxError);
    }
  }
}

final _boxes = [
  BoxMapItem(
    boxId: '0',
    books: <MapBookItem>[
      MapBookItem(
          categories: ['Action'],
          thumbnailUrl:
              'http://2.bp.blogspot.com/-LJSpEbfis3s/Tv56jNiYRAI/AAAAAAAAKMo/dbqxU7d7Dbk/s1600/harry+potter+book+7+cover+deathly+hallows.jpg'),
      MapBookItem(
          categories: ['Comedy'],
          thumbnailUrl: 'http://mediaroom.scholastic.com/files/HP4cover.jpg'),
      MapBookItem(
          categories: ['Thriller'],
          thumbnailUrl:
              'https://ewedit.files.wordpress.com/2016/09/dh-uk-kids-jacket-art.jpg?w=426'),
      MapBookItem(
          categories: ['Educational'],
          thumbnailUrl:
              'https://upload.wikimedia.org/wikipedia/en/4/48/ErnestHemmingway_ForWhomTheBellTolls.jpg'),
      MapBookItem(categories: ['Action'], thumbnailUrl: null),
    ],
    description:
        'Sup yall its me coming back with a longer description. These things can go all the way up to 300 characters i believe. I do not believe that I will go that high, but you never know, I am testing to see if this scales well when there is more text than it usually would be. I still have quite a bit to go before the text limit runs out, which is at 500. Closin gup on 400 now, just a few more to go!',
    latitude: 59.1303617,
    longitude: 11.3543517,
    publishedOn: DateTime.now(),
    publishedById: 'me',
    title: 'Box title 1',
  ),
  BoxMapItem(
    boxId: '1',
    books: <MapBookItem>[],
    description: 'Here comes the second box...',
    latitude: 59.19,
    longitude: 11.3543517,
    publishedOn: DateTime.now(),
    publishedById: 'me',
    title: 'This is the second box',
  ),
  BoxMapItem(
    boxId: '2',
    books: <MapBookItem>[],
    description: 'And this is the description of the third box, here, it, goes. Okay?',
    latitude: 59.26,
    longitude: 11.26,
    publishedOn: DateTime.now(),
    publishedById: 'me',
    title: 'Third sample box',
  ),
];
