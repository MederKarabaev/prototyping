import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prototyping/core/functions/cash_func.dart';
import 'package:prototyping/core/functions/push_router_func.dart';
import 'package:prototyping/features/home/presentation/home_screen/chats_screen.dart';
import 'package:prototyping/features/home/presentation/home_screen/cubit/home_cubit.dart';
import 'package:prototyping/features/home/presentation/home_screen/discover_screen.dart';
import 'package:prototyping/features/home/presentation/home_screen/profile_screen.dart';
import 'package:prototyping/features/home/presentation/home_screen/search_screen.dart';
import 'package:prototyping/routes/mobile_auto_router.gr.dart';
import 'package:prototyping/server/service_locator.dart';

@RoutePage()
class HomeVe extends StatelessWidget {
  const HomeVe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => sl<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is HomeError) {
          } else if (state is HomeLoaded) {}
          return const HomeScreen();
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const DiscoverScreen(),
      const SearchScreen(),
      Center(child: InkWell(onTap: () => close(), child: const Text('+ Page'))),
      const ChatsScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void close() {
    CacheFunc.removeBooleanValue();
    AppRouting.pushAndPopUntilFunction(const AuthViewRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/1.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/search.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/new.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Comment.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/bell.svg'),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey.shade600,
        unselectedItemColor: Colors.grey.shade600,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
