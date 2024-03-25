import 'package:flutter/material.dart';

class Navigation {
  static void pushNamed(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static void pushNamedandRemove(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
