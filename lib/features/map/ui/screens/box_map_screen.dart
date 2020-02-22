import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/feed/feed.dart';
import 'package:bookzbox/features/map/box_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoxMapScreen extends StatefulWidget {
  final MapStore mapStore;

  const BoxMapScreen({Key key, this.mapStore}) : super(key: key);

  @override
  _BoxMapScreenState createState() => _BoxMapScreenState();
}

class _BoxMapScreenState extends State<BoxMapScreen> {
  final startPos = LatLng(45.521563, -122.677433);

  Set<Marker> markers = Set();

  GoogleMapController mapController;

  LatLng currentCamPos;

  int iconSize = 77;

  int oldIconSize = 0;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    reloadMarkers();
  }

  void reloadMarkers() async {
    if (iconSize == oldIconSize) {
      // If icon size is the same as last time icons were updated, do not re-render them again, to save performance.
      return;
    }

    final markerIcon =
        await AssetLoader.getBytesFromAsset('assets/images/box-map-icon.png', iconSize)
            .then((b) => BitmapDescriptor.fromBytes(b));

    oldIconSize = iconSize;

    print('Creating new markers with icon size: $iconSize');
    setState(() {
      markers = _boxes.map((b) {
        return Marker(
          markerId: MarkerId(b.id),
          position: LatLng(b.lat, b.lng),
          onTap: () => buildDetailsWidget(b),
          icon: markerIcon,
        );
      }).toSet();
    });
  }

  void buildDetailsWidget(BoxFeedListItem box) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Container(
          child: SingleChildScrollView(
            child: ModalBoxDetails(box: box),
          ),
          height: MediaQuery.of(context).size.height * 0.75,
        ),
      ),
    );
  }

  void onCameraIdle() => reloadMarkers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: startPos,
          zoom: 11.0,
        ),
        onCameraIdle: onCameraIdle,
        onCameraMove: (camPos) {
          currentCamPos = camPos.target;
          iconSize = camPos.zoom.round() * 7;
        },
        myLocationButtonEnabled: false,
      ),
    );
  }
}

final _boxes = [
  BoxFeedListItem(
    id: '0',
    books: <BoxFeedBook>[
      BoxFeedBook(
          categories: ['Action'],
          thumbnailUrl:
              'http://2.bp.blogspot.com/-LJSpEbfis3s/Tv56jNiYRAI/AAAAAAAAKMo/dbqxU7d7Dbk/s1600/harry+potter+book+7+cover+deathly+hallows.jpg'),
      BoxFeedBook(
          categories: ['Comedy'],
          thumbnailUrl: 'http://mediaroom.scholastic.com/files/HP4cover.jpg'),
      BoxFeedBook(
          categories: ['Thriller'],
          thumbnailUrl:
              'https://ewedit.files.wordpress.com/2016/09/dh-uk-kids-jacket-art.jpg?w=426'),
      BoxFeedBook(
          categories: ['Educational'],
          thumbnailUrl:
              'https://upload.wikimedia.org/wikipedia/en/4/48/ErnestHemmingway_ForWhomTheBellTolls.jpg'),
      BoxFeedBook(categories: ['Action'], thumbnailUrl: null),
    ],
    description:
        'Sup yall its me coming back with a longer description. These things can go all the way up to 300 characters i believe. I do not believe that I will go that high, but you never know, I am testing to see if this scales well when there is more text than it usually would be. I still have quite a bit to go before the text limit runs out, which is at 500. Closin gup on 400 now, just a few more to go!',
    lat: 45.521563,
    lng: -122.677433,
    publishedOn: DateTime.now(),
    publisherId: 'me',
    status: BoxStatus.public,
    title: 'Box title 1',
  ),
  BoxFeedListItem(
    id: '1',
    books: <BoxFeedBook>[],
    description: 'Here comes the second box...',
    lat: 45.521563,
    lng: -122.70,
    publishedOn: DateTime.now(),
    publisherId: 'me',
    status: BoxStatus.public,
    title: 'This is the second box',
  ),
  BoxFeedListItem(
    id: '2',
    books: <BoxFeedBook>[],
    description: 'And this is the description of the third box, here, it, goes. Okay?',
    lat: 45.54,
    lng: -122.65,
    publishedOn: DateTime.now(),
    publisherId: 'me',
    status: BoxStatus.public,
    title: 'Third sample box',
  ),
];
