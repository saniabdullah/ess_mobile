import 'package:ess_mobile/screens/user/history_approval/history_approval_screen.dart';
import 'package:ess_mobile/screens/user/home/home_screen.dart';
import 'package:ess_mobile/screens/user/profile/profile_screen.dart';
import 'package:ess_mobile/screens/user/submition/submition_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ess_mobile/screens/user/main/bottom_navbar_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavBarController());

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            HomeScreen(),
            SubmitionScreen(),
            HistoryApprovalScreen(),
            ProfileScreen(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          // backgroundColor: Colors.amber,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.changePage(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_open_rounded,
              ),
              label: 'Submition',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: 'History',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person,
            //   ),
            //   label: 'Profile',
            // ),
          ],
        );
      }),
    );
  }
}
