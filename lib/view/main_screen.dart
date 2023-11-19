import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/view/pages/calender.dart';
import 'package:salon_app/view/pages/category.dart';
import 'package:salon_app/view/pages/chat.dart';
import 'package:salon_app/view/pages/homepage.dart';
import 'package:salon_app/view/pages/profile.dart';
import 'package:salon_app/view_model/constraints.dart';
import 'package:salon_app/view_model/cubit/homescreen_cubit/homescreen_cubit.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomescreenCubit, HomescreenState>(
      builder: (context, state) {
        final model = context.read<HomescreenCubit>();
        return SafeArea(
          child: Scaffold(
            appBar: model.navIndex != 0
                ? AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      pageTitles[model.navIndex],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    centerTitle: true,
                  )
                : null,
            body: <Widget>[
              HomePage(model: model),
              const CategoryPage(),
              const CalenderPage(),
              const ChatPage(),
              const ProfilePage()
            ][model.navIndex],
            bottomNavigationBar: NavigationBar(
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home_filled),
                      label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.window_outlined),
                      selectedIcon: Icon(Icons.window),
                      label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.calendar_month_outlined),
                      selectedIcon: Icon(Icons.calendar_month),
                      label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.sms_outlined),
                      selectedIcon: Icon(Icons.sms),
                      label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.person_outlined),
                      selectedIcon: Icon(Icons.person),
                      label: ''),
                ],
                onDestinationSelected: (index) {
                  model.navItemChange(index);
                },
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                height: 65,
                // selectedIndex: context.read<HomescreenCubit>().navIndex,
                selectedIndex: model.navIndex,
                backgroundColor: Colors.white70),
          ),
        );
      },
    );
  }
}
