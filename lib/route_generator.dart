import 'package:astrologyapp/pages/AccountPage.dart';
import 'package:astrologyapp/pages/HomePage.dart';
import 'package:astrologyapp/pages/schedules_page/schedules.dart';
import 'package:flutter/material.dart';

import 'GoogleMeetUtils/EventDetails.dart';
import 'main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Home.routeName:
        return MaterialPageRoute(builder: (_) => Home());

      case AccountPageWidget.routeName:
        return MaterialPageRoute(builder: (_) => AccountPageWidget());

      case HomePageWidget.routeName:
        return MaterialPageRoute(builder: (_) => HomePageWidget());

      case SchedulesPage.routeName:
        return MaterialPageRoute(builder: (_) => SchedulesPage());

      case DashboardScreen.routeName:
        final data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => DashboardScreen(
                  astrologerEmail: data,
                ));
      default:
        return _errorRoute();
    }
  }

  //error page ..
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text("Page not Found"),
        ),
      );
    });
  }
}