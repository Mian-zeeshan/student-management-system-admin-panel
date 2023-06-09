import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/provider/page_index_provider.dart';

import '../../../../core/constants/color_constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final globelProvider = Provider.of<PageIndexProvider>(context);
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: defaultPadding * 3,
                ),
                Image.asset(
                  "assets/logo/logo_icon.png",
                  scale: 5,
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                const Text("Student Tracking System")
              ],
            )),
            ExpansionTile(
              title: const Text("Admin"),
              leading: const Icon(Icons.person), //add icon
              childrenPadding: const EdgeInsets.only(left: 0), //children padding
              children: [
                DrawerListTile(
                  title: "Dashbard",
                  svgSrc: "assets/icons/menu_dashbord.svg",
                  press: () {
                    globelProvider.setPageIndex(0);

                  },
                ),
                DrawerListTile(
                  title: "Customer",
                  svgSrc: "assets/icons/menu_dashbord.svg",
                  press: () {
                      globelProvider.setPageIndex(1);

                  },
                ),
                DrawerListTile(
                  title: "Customer Admins",
                  svgSrc: "assets/icons/menu_dashbord.svg",
                  press: () {
                    globelProvider.setPageIndex(2);
                    // provider.selectstd(true);
                    // provider.deslectchp();
                    // provider.deslectsubchp();
                  },
                ),

                //more child menu
              ],
            ),
            DrawerListTile(
              title: "Posts",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Pages",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Categories",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Appearance",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Users",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Tools",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
