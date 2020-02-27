import 'package:bookzbox/features/box/models/models.dart';
import 'package:bookzbox/features/box_details/box_details.dart';
import 'package:bookzbox/features/box/helpers/status_extensions.dart';
import 'package:bookzbox/features/location/location.dart';
import 'package:bookzbox/common/extensions/extensions.dart';
import 'package:bookzbox/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BoxDetails extends StatelessWidget {
  final Box box;
  final ILocationService locationService;

  const BoxDetails({
    Key key,
    @required this.box,
    @required this.locationService,
  }) : super(key: key);

  static const _boxInfoHeader = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static const _boxInfoBody = TextStyle(
    fontSize: 14.0,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _books(context),
            _details(context),
          ],
        ),
      ),
    );
  }

  Container _books(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 25.0,
      ),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BookSwiper(books: box.books),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Container _details(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0),
            _boxInfoPair(
              S.of(context).detailsDescription,
              [box.description],
            ),
            _boxInfoPair(
              S.of(context).detailsAboutSeller,
              [
                'Registered 4 months ago',
                'Very positive feedback',
              ],
            ),
            _locationColumn(context),
            _boxInfoPair(
              S.of(context).detailsStatus,
              [box.status.toLocalizedString(context)],
            ),
            _boxInfoPair(
              S.of(context).detailsPublishedOn,
              [DateFormat.yMMMd().add_jm().format(box.publishDateTime)],
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }

  FutureBuilder<String> _locationColumn(BuildContext context) {
    return FutureBuilder<String>(
      future: _getLocationString(context),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return _boxInfoPair(
              S.of(context).detailsLocation, [S.of(context).detailsLocationLoading]);
        } else {
          return _boxInfoPair(S.of(context).detailsLocation, [snapshot.data]);
        }
      },
    );
  }

  Column _boxInfoPair(String header, List<String> content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(header, style: _boxInfoHeader),
        SizedBox(height: 10.0),
        ...content.map((s) => Text(s ?? '--', style: _boxInfoBody)),
        SizedBox(height: 30.0),
      ],
    );
  }

  Future<String> _getLocationString(BuildContext context) async =>
      (await locationService.getLocationDataFrom(box.latitude, box.longitude))
          .map((p) => p.toExtendedLocationString())
          .filter((s) => s.isNotEmpty)
          .getOrElse(() => S.of(context).detailsNoLocation);
}
