import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:widgets/core/extensions/build_context_ext.dart';
import 'package:widgets/core/extensions/color_ext.dart';
import 'package:widgets/presentation/home/arrangement/arrangement_page.dart';
import 'package:widgets/sharedWidgets/keep_alive_wrapper.dart';
import 'package:widgets/theme/app_font.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: MainNavBar(
          currentIndex: controller.currentIndex,
          onTap: controller.onTapIndex,
        ),
        body: TabBarView(controller: controller.tabController, children: [
          KeepAliveWrapper(child: ArrangementPage()),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellowAccent,
          ),
          Container(
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedLabelStyle: AppFonts.Medium10,
      selectedItemColor: context.Primary,
      unselectedItemColor: context.Secondary2,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      unselectedLabelStyle: AppFonts.Medium10,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/Date_today.svg',
              colorFilter: context.Secondary2.filterscrin,
            ),
            label: 'Arrangement',
            activeIcon: SvgPicture.asset('assets/svg/Date_today.svg')),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/Chat_alt.svg',
              colorFilter: context.Secondary2.filterscrin,
            ),
            activeIcon: SvgPicture.asset('assets/svg/Chat_alt.svg'),
            label: 'Meldinger'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/Bell.svg',
              colorFilter: context.Secondary2.filterscrin,
            ),
            activeIcon: SvgPicture.asset('assets/svg/Bell.svg'),
            label: 'Beskjed'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/Menu.svg',
              colorFilter: context.Secondary2.filterscrin,
            ),
            activeIcon: SvgPicture.asset('assets/svg/Menu.svg'),
            label: 'Meny'),
      ],
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            counter++;
          });
        },
        child: Text('Clicked: ${counter.toString()}'));
  }
}
