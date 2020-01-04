import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_business_card/url_utils.dart';
import 'package:my_business_card/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MyBusinessCard()),
    );
  }
}

class MyBusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MediaQuery.of(context).size.width < 600
            ? _buildXSLayout()
            : _buildNotXSLayout());
  }

  Widget _buildXSLayout() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _mainInfo(),
          Divider(
            color: kDividerColor,
            height: 40.0,
            indent: 40.0,
            endIndent: 40.0,
            thickness: 3.0,
          ),
          Expanded(
            child: _socialLinkInfo(),
          )
        ]);
  }

  Widget _buildNotXSLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _mainInfo()),
        Expanded(flex: 1, child: VerticalDivider(
          width: 40.0,
          indent: 40.0,
          endIndent: 40.0,
          thickness: 3.0,
          color: kDividerColor,
        ),),
        Expanded( flex: 7, child: _socialLinkInfo()),
      ],
    );
  }

  Widget _mainInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('assets/images/rkAvatar.jpg'),
          ),
        ),
        Text(kName, style: kNameTextStyle),
        Text(kTitle, style: kTitleTextStyle),
      ],
    );
  }

  Widget _socialLinkInfo() {
    return  ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.twitter, color: kIconColors),
              title: Text('@rihanna_ke', style: kSocialTextStyle),
              onTap: () {
                  UrlUtils.open('https://twitter.com/rihanna_ke');
              },
            )),
        Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.linkedin, color: kIconColors),
              title: Text('rihanna-kedir', style: kSocialTextStyle),
              onTap: () {
                  UrlUtils.open(
                      'https://www.linkedin.com/in/rihanna-kedir-05068568/');
              },
            )),
        Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.github, color: kIconColors),
              title: Text('rihannaKe', style: kSocialTextStyle),
              onTap: () {
                  UrlUtils.open('https://github.com/rihannaKe');
              },
            )),
        Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.globeAfrica, color: kIconColors),
              title: Text('www.rihannakedir.dev', style: kSocialTextStyle),
              onTap: () {
                  UrlUtils.open('https://rihannakedir.dev');
              },
            )),
        Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.envelopeOpen, color: kIconColors),
              title: Text(
                  'rihanna.kedir.dev@gmail.com', style: kSocialTextStyle),
              onTap: () {
                  UrlUtils.sendEmail('rihanna.kedir.dev@gmail.com');
              },
            )
        ),
      ],
    );
  }

}
