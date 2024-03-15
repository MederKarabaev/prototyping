import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototyping/features/home/presentation/home_screen/cubit/home_cubit.dart';
import 'package:prototyping/models/photo_model.dart';
import 'package:prototyping/widgets/custom_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<PhotoModel> _filteredPhotos = [];
  int _displayedPhotosCount = 15;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterPhotos);
  }

  void _filterPhotos() {
    final query = _searchController.text.toLowerCase();
    final cubit = context.read<HomeCubit>();
    if (query.isNotEmpty) {
      setState(() {
        _filteredPhotos = cubit.listPhotos
            .where((photo) => photo.title.toLowerCase().contains(query))
            .toList();
        _displayedPhotosCount = 15; // Reset count on new search
      });
    } else {
      setState(() {
        _filteredPhotos = [];
      });
    }
  }

  void _showMore() {
    setState(() {
      int remainingPhotos = _filteredPhotos.length - _displayedPhotosCount;
      _displayedPhotosCount += remainingPhotos >= 9 ? 9 : remainingPhotos;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> photoWidgets = _searchController.text.isNotEmpty
        ? _filteredPhotos
            .take(_displayedPhotosCount)
            .map((photo) => const ColoredBox(color: Colors.amber))
            .toList()
        : [];

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 32),
        const Text('Search',
            style: TextStyle(fontSize: 36, color: Colors.black)),
        const SizedBox(height: 32),
        DecoratedBox(
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search all photos',
              hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(17),
            ),
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 11,
          mainAxisSpacing: 11,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: photoWidgets,
        ),
        if (_searchController.text.isNotEmpty &&
            _filteredPhotos.length > _displayedPhotosCount)
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
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
