import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sawwah_app/views/my_ticket_view2.dart';

import '../views/home_view.dart';
import '../views/favorites_view.dart';
import '../views/my_ticket_view.dart';
import '../Ai_views/Ai_getstarted.dart';
import '../views/profile_view.dart';

class MainNavShell extends StatefulWidget {
  const MainNavShell({super.key});

  @override
  State<MainNavShell> createState() => _MainNavShellState();
}

class _MainNavShellState extends State<MainNavShell> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      FavoritesView(key: UniqueKey()),
      // const MyTicketView(), 
      const Myticket(), 
      const AiGetStartedView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Color(0xFF8B57E6),
        inactiveColorPrimary: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: ("Favorites"),
        activeColorPrimary: Color(0xFF8B57E6),
        inactiveColorPrimary: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.confirmation_number, color: Colors.white),
        title: ("My Ticket"),
        activeColorPrimary: Color(0xFF8B57E6),
        inactiveColorPrimary: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.auto_awesome),
        title: ("EveAI"),
        activeColorPrimary: Color(0xFF8B57E6),
        inactiveColorPrimary: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ("Profile"),
        activeColorPrimary: Color(0xFF8B57E6),
        inactiveColorPrimary: Colors.white70,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: const Color(0xFF121212),
      navBarHeight: 60,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(12.0),
        colorBehindNavBar: Colors.black,
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
