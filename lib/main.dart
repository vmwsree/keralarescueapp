import 'package:flutter/material.dart';
import 'package:keralarescue/ActionCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'routes.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kerela Rescue',
      theme: new ThemeData(
        fontFamily: 'Raleway',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primaryColor: Color(0xFFEDEDED),
      ),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _loading=false;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  _launchURL() async {
    const url = 'https://keralarescue.in/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _helpraise() async {
    //Navigator.of(context).pushNamed("/helpneed");
    var currentLocation = <String, double>{};

    var location = new Location();

// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      currentLocation = await location.getLocation;
    } on PlatformException {
      currentLocation = null;
    }
    const url = 'https://keralarescue.in/request/';
    if (await canLaunch(url)) {

    await launch(url).whenComplete(onValue);

    } else {
    throw 'Could not launch $url';
    }
  }
  onValue(){
  setState(() {
  _loading=false;
  });

  }
  _districtneeds() async {
//    setState(() {
//      _loading=true;
//    });
    const url = 'https://keralarescue.in/district_needs/';
    if (await canLaunch(url)) {

    await launch(url).whenComplete(onValue);

    } else {
    throw 'Could not launch $url';
    }


  }
  _tocontribute() async {
    const url = 'https://keralarescue.in/reg_contrib/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _regitervolunteer() async {
    const url = 'https://keralarescue.in/volunteer/';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }
  _contact() async{

    const url = 'https://keralarescue.in/contactus/';
    if (await canLaunch(url)) {
    await launch(url);

    } else {
    throw 'Could not launch $url';
    }
  }
  _regiteredreq() {
    Navigator.of(context).pushNamed("/helpneed");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        leading: InkWell(
          child: Icon(
            Icons.home,
          ),
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Tap'),
            ));
          },
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            new ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      "Goto keralarescue.in",
                    ),
                    onTap: _launchURL,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ActionCard(
                    title: '''REQUEST \nFOR HELP''',
                    malayalam: "സഹായം അഭ്യര്‍ഥിക്കാന്‍‍",
                    icon: FontAwesomeIcons.seedling,
                    fun: _helpraise,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ActionCard(
                    title: '''DISTRICT NEEDS \nAND\nCOLLECTION CENTERS''',
                    malayalam: "ജില്ലകളിലെ ആവശ്യങ്ങള്‍‍‍",
                    icon: Icons.location_on,
                    fun: _districtneeds,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ActionCard(
                    title: '''TO CONTRIBUTE''',
                    malayalam: "സംഭാവന നല്‍കാന്‍‍‍",
                    icon: FontAwesomeIcons.handHoldingHeart,
                    fun: _tocontribute,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ActionCard(
                    title: '''REGISTER AS\nA VOULUNTEER''',
                    malayalam: "വൊളന്‍റീയര്‍ ആകാന്‍",
                    icon: FontAwesomeIcons.userAlt,
                    fun: _regitervolunteer,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ActionCard(
                    title: ''' CONTACT \nINFO''',
                    malayalam: "ഞങ്ങളുമായി ബന്ധപ്പെടാന്‍",
                    icon: FontAwesomeIcons.phone,
                    fun: _contact,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ActionCard(
                    title: '''REGISTERED REQUESTS''',
                    malayalam: "ഇതു വരെ ആവശ്യപ്പെട്ടവ‍‍",
                    icon: FontAwesomeIcons.table,
                    fun: _helpraise,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("This is not the official Kerala Govt App , But it collects and share data between keralarescue.in"),
              )
              ],
            ),_loading?Center(child: CircularProgressIndicator()):Container(color: Colors.black,width: 0.0,height: 0.0,)
          ],

        ),
      ),
      floatingActionButton: new FloatingActionButton(backgroundColor:Colors.green,
        onPressed: _helpraise,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
