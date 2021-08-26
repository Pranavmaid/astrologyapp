import 'package:astrologyapp/GoogleMeetUtils/EventDetails.dart';
import 'package:astrologyapp/GoogleMeetUtils/calenderevent.dart';
import 'package:astrologyapp/GoogleMeetUtils/secrate.dart';
import 'package:astrologyapp/pages/AccountPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> calender() async {
  var _clientID = new ClientId(Secret.getId(), "");
  const _scopes = const [cal.CalendarApi.calendarScope];
  await clientViaUserConsent(_clientID, _scopes, prompt)
      .then((AuthClient client) async {
    CalendarClient.calendar = cal.CalendarApi(client);
  });
}

void prompt(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ConsultWidget extends StatefulWidget {
  @override
  _ConsultWidgetState createState() => _ConsultWidgetState();
}

class _ConsultWidgetState extends State<ConsultWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Consult',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPageWidget()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(user.photoURL!),
                ),
                radius: 18,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              // gradient: LinearGradient(
              //     begin: Alignment.centerLeft,
              //     end: Alignment.centerRight,
              //     colors: [Color(0xfffe8c00), Color(0xfff83600)]),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/bro.jpg'),
                            radius: 30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Icon(
                                Icons.star_rate,
                                color: Color(0xFFFFD700),
                                size: 24,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              // padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.star_rate,
                                color: Color(0xFFFFD700),
                                size: 24,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              // padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.star_rate,
                                color: Color(0xFFFFD700),
                                size: 24,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              // padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.star_rate,
                                color: Color(0xFFFFD700),
                                size: 24,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              // padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.star_rate,
                                color: Color(0xFFFFD700),
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 1, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Shivam Karle',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    'Marriage, Career, Job, Study. Love',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Fess  - ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ' ₹',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()));
                        print('Button pressed ...');
                      },
                      label: Text('Book Meeting'),
                      icon: Icon(
                        Icons.call_rounded,
                        size: 15,
                      ),
                      style: TextButton.styleFrom(
                        // padding: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.white,
                        backgroundColor: Colors.orange,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
