
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void urlLaunch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('could not launch $url');
      throw 'could not launch $url';
    }
  }


  Future<void> launchFacebook(String fbUrl,String fbWebUrl)
  async {
    try {
      bool launched = await launch(fbUrl, forceSafariVC: false);
      print("Launched Native app $launched");

      if (!launched) {
        await launch(fbWebUrl, forceSafariVC: false);
        print("Launched browser $launched");
      }
    } catch (e) {
      await launch(fbWebUrl, forceSafariVC: false);
      print("Inside catch");
    }
  }
//
//   Future<void> launchFacebook(String fbUrl,String fbWebUrl) async {
//
//   if (await canLaunch(fbWebUrl)) {
//     await launch(fbWebUrl, forceSafariVC: true, forceWebView: true);
//   } else {
//     throw 'Could not launch $fbWebUrl';
//   }
// }

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   }
  //   else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text('URL Launcher')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    urlLaunch('https://google.com');
                  },
                  child: Text('Browser'),
                ),
                RaisedButton(
                  onPressed: () {
                    // urlLaunch(
                    //     'mailto:your@gmail.com?subject=Subject&body=body');
                   urlLaunch('mailto:');
                  },
                  child: Text('Email'),
                ),
                RaisedButton(
                  onPressed: () {
                    urlLaunch('tel:+91 9876543210');
                  },
                  child: Text('Phone'),

                ),
                RaisedButton(
                  onPressed: () {
                    //urlLaunch('sms:5550101234');
                    urlLaunch('sms:');
                  },
                  child: Text('SMS'),
                ),
                RaisedButton(
                  onPressed: () {
                   //launchFacebook("fb://facewebmodal/f?href=", "https://facebook.com/AliForDigitalIsrael/");
                    launchFacebook("fb://facewebmodal/f?href=", "https://facebook.com/");
                  },
                  child: Text('Facebook'),
                ),
                RaisedButton(
                  onPressed: () {
                    urlLaunch('https://play.google.com/store');
                  },
                  child: Text('PlayStore'),
                ),
                RaisedButton(
                  onPressed: () {
                    urlLaunch('https://apps.apple.com/in/app/transport-fever-2/id1537063060?mt=12');
                  },
                  child: Text('AppStore'),
                ),

              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
