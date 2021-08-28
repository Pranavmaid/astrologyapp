import 'package:astrologyapp/main.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

String zodiacsign = 'assets/Rive/Aquarius.riv';
String zodiacsignname = 'Aquarius';

class HorescopeWidget extends StatefulWidget {
  const HorescopeWidget({Key? key}) : super(key: key);

  @override
  _HorescopeWidgetState createState() => _HorescopeWidgetState();
}

class _HorescopeWidgetState extends State<HorescopeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                  child: Text(
                    'Select Zodiac Sign',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: selectzodiacsign(
                      context, 'assets/Rive/Aquarius.riv', 'Aquarius'),
                ),
                selectzodiacsign(context, 'assets/Rive/Aries.riv', 'Aries'),
                selectzodiacsign(context, 'assets/Rive/cancer.riv', 'Cancer'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selectzodiacsign(
                    context, 'assets/Rive/Capricorn.riv', 'Capricorn'),
                selectzodiacsign(context, 'assets/Rive/gemini.riv', 'Gemini'),
                selectzodiacsign(context, 'assets/Rive/libra.riv', 'Libra'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selectzodiacsign(context, 'assets/Rive/lio.riv', 'Leo'),
                selectzodiacsign(context, 'assets/Rive/pisccs.riv', 'Pisces'),
                selectzodiacsign(
                    context, 'assets/Rive/Sagittarius.riv', 'Sagittarius'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selectzodiacsign(context, 'assets/Rive/Scorpio.riv', 'Scorpio'),
                selectzodiacsign(context, 'assets/Rive/taurus.riv', 'Taurus'),
                selectzodiacsign(context, 'assets/Rive/virgo.riv', 'Virgo'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget selectzodiacsign(
      BuildContext context, String zodiacsign1, String zodiacsignname1) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              height: MediaQuery.of(context).size.width / 3.7,
              child: RiveAnimation.asset(
                zodiacsign1,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              zodiacsignname1,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          zodiacsign = zodiacsign1;
          zodiacsignname = zodiacsignname1;
        });
        // Navigator.pop(context, () {
        //   setState(() {});
        // });
        // Navigator.pop(context,);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PageNavigator(),
        //   ),
        // );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        ).then((value) => setState(() {}));
      },
    );
  }
}