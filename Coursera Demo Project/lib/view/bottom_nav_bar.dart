import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:globe_pulse/view/home_view.dart';
import 'package:globe_pulse/view/news_view.dart';
import 'package:globe_pulse/view/profile_view.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(), 
    NewsView(), 
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light?
          AppColors.cardColorLT : AppColors.cardColorDT,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).brightness == Brightness.light?
          AppColors.primaryColorLT : AppColors.primaryColorDT,
          unselectedItemColor: Theme.of(context).brightness == Brightness.light?
          AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          enableFeedback: false,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book_online_outlined,), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: "Profile"),
        ],
          currentIndex: currentIndex,
          onTap: (index){
          setState(() {
            currentIndex = index;
          });
          },
        ),
      ),
    );
  }
}
