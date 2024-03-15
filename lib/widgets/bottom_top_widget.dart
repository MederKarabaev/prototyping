import 'package:flutter/material.dart';

class BottomTopWidget extends StatelessWidget {
  const BottomTopWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Container(
        width: 120,
        height: 1.5,
        color: Colors.white,
      ),
    );
  }
}
