import 'package:flutter/material.dart';

import 'package:machine_test/ui/screens/home_page.dart';
import 'package:machine_test/ui/screens/repos_webview.dart';
import 'package:machine_test/ui/screens/user_details_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String user_details = '/user-details';
  static const String webview = '/web-view';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(const HomeScreen(), settings);
      case user_details:
        return _buildRoute(const UserDetailsScreen(), settings);
      case webview:
        return _buildRoute(ReposWebView(), settings);

      default:
        return _buildRoute(Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
