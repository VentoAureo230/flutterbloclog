import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclog/blocs/auth_bloc/authentication_bloc.dart';
import 'package:flutterbloclog/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutterbloclog/screens/home/home_screen.dart';
import 'package:flutterbloclog/screens/message/message_screen.dart';
import 'package:flutterbloclog/screens/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PersistentTabScreen extends StatefulWidget {
  const PersistentTabScreen({super.key});

  @override
  State<PersistentTabScreen> createState() => _PersistentTabScreenState();
}

class _PersistentTabScreenState extends State<PersistentTabScreen> {
  final PersistentTabController _controller = PersistentTabController();
  
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ChatScreen(),
      BlocProvider(
        create: (context) => SignInBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository),
        child: const ProfileScreen(),
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat_bubble),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_fill, size: 30,),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
    controller: _controller,
    screens: _buildScreens(),
    items: _navBarItems(),
    confineInSafeArea: true,
    backgroundColor: Theme.of(context).colorScheme.background,
    handleAndroidBackButtonPress: true,
    resizeToAvoidBottomInset: true,
    stateManagement: true,
    hideNavigationBarWhenKeyboardShows: true,
    decoration: NavBarDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.grey.shade300,
          width: 2
        )
      ),
      colorBehindNavBar: Colors.white,
    ),
    popAllScreensOnTapOfSelectedTab: true,
    popActionScreens: PopActionScreensType.all,
    itemAnimationProperties: const ItemAnimationProperties(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease
    ),
    screenTransitionAnimation: const ScreenTransitionAnimation(
      animateTabTransition: true,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200)
    ),
    navBarStyle: NavBarStyle.style12,
    );
  }
}
