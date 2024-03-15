import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prototyping/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<int> items =
      List<int>.generate(20, (i) => i + 1); // Генерируем 20 элементов
  int displayedItemsCount = 5;

  void _showMore() {
    setState(() {
      displayedItemsCount = items.length; // Показать все элементы
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: CircleAvatar(backgroundColor: Colors.amber, radius: 64),
          ),
          const Text(
            'Jane',
            style: TextStyle(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 32),
            child: Text(
              'San francisco, ca',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(
            color: Colors.black,
            radius: 6,
            onPress: () {},
            text: ('follow jane').toUpperCase(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: CustomButton(
              color: Colors.white,
              borderColor: Colors.black,
              borderWidth: 2,
              radius: 6,
              onPress: () {},
              text: ('message').toUpperCase(),
              textColor: Colors.black,
            ),
          ),
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 9,
            children: items.take(displayedItemsCount).map((item) {
              return StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: item % 5 == 0 || (item + 1) % 5 == 0 ? 1 : 2,
                child: ColoredBox(
                    color: Colors.amber, child: Text(item.toString())),
              );
            }).toList(),
          ),
          if (displayedItemsCount < items.length)
            CustomButton(
              aroundButtonPadding: const EdgeInsets.symmetric(vertical: 32),
              color: Colors.white,
              borderColor: Colors.black,
              borderWidth: 2,
              radius: 6,
              onPress: _showMore,
              text: ('See More').toUpperCase(),
              textColor: Colors.black,
            ),
        ],
      ),
    );
  }
}
