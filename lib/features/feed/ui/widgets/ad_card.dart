import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdCard extends StatelessWidget {
  final PageController pageController;
  final int index;

  const AdCard({Key key, this.pageController, this.index}) : super(key: key);

  // TODO: Remove. This is just a demo implementation for focus group.
  Future<void> _launchURL() async {
    const url = 'https://ark.no';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, wdgt) {
        var value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - value.abs() * 0.3).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * MediaQuery.of(context).size.height * 0.85,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: wdgt,
          ),
        );
      },
      animation: pageController,
      child: GestureDetector(
        onTap: () async => _launchURL(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withAlpha(100),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: _body(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _body(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Stack(
      children: [
        Image.asset(
          'assets/images/ad.jpg',
          fit: BoxFit.fill,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.black45,
          ),
          child: Text(
            'Advertisement',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
