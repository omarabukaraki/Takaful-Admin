import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> route =
      <String, WidgetBuilder>{};
}
