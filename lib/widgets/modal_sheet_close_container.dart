import 'package:flutter/material.dart';

class ModelSheetCloseContainer extends StatelessWidget {
  const ModelSheetCloseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
