import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prototyping/features/home/presentation/home_screen/cubit/home_cubit.dart';
import 'package:prototyping/widgets/custom_button.dart';
import 'package:prototyping/widgets/show_dialog_discover.dart';
import 'package:prototyping/widgets/spaces.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _displayedPhotosCount = 10;

  void _showMorePhotos() {
    setState(() {
      _displayedPhotosCount = context.read<HomeCubit>().listPhotos.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    final photosToShow = cubit.listPhotos.take(_displayedPhotosCount).toList();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 32),
        const Text(
          'Discover',
          style: TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'What’s new today',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 387,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.listPosts.length,
              itemBuilder: (context, i) {
                final post = cubit.listPosts[i];
                final user = cubit.listUsers
                    .firstWhere((user) => user.id == post.userId);
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () => showDialogDiscover(context, user),
                    child: SizedBox(
                      width: context.width - 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(
                              child: ColoredBox(
                            color: Colors.amber,
                          )),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 28,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 14,
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              height: .9,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          user.email,
                                          style: const TextStyle(
                                              fontSize: 11, height: .9),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(height: 48),
        const Text(
          'Browse all',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 24),
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 9,
          children: photosToShow.map((photo) {
            int index = cubit.listPhotos.indexOf(photo);
            final user =
                cubit.listUsers.firstWhere((u) => u.id == photo.userId);
            int mainAxisCellCount =
                (index % 5 == 0 || (index - 4) % 5 == 0) ? 1 : 2;
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: mainAxisCellCount,
              child: InkWell(
                onTap: () => showDialogDiscover(context, user),
                child: const ColoredBox(color: Colors.lightGreen),
              ),
            );
          }).toList(),
        ),
        if (cubit.listPhotos.length > _displayedPhotosCount)
          CustomButton(
            aroundButtonPadding: const EdgeInsets.symmetric(vertical: 32),
            color: Colors.white,
            borderColor: Colors.black,
            borderWidth: 2,
            radius: 6,
            onPress: _showMorePhotos,
            text: ('See More').toUpperCase(),
            textColor: Colors.black,
          ),
      ],
    );
  }
}
