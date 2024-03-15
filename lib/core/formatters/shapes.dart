import 'package:flutter/material.dart';

class AppShapes {
  static bottomNavigatorShape({double radius = 20}) => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      );
}
