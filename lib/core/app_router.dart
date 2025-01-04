import 'package:flutter/material.dart';

class AppRouter {

  /// Navigate to new screen
  static Future<dynamic> navigateTo(BuildContext context, Widget screen, {bool replace = false, bool removeAll = false}){
    if(!removeAll){
      if (replace) {
        return _replaceWithScreen(context, screen);
      } else {
        return _goToScreen(context, screen);
      }

    } else {
      return _removeUntilScreen(context, screen);
    }
  }


  static Future<dynamic> _goToScreen(context, screen){
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen));
  }

  static Future<dynamic> _replaceWithScreen(context, screen){
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen));
  }

  static Future<dynamic> _removeUntilScreen(context, screen){
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

}