import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/provider/page_index_provider.dart';

class CustomerAdminSideMenue extends StatelessWidget {
  const CustomerAdminSideMenue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageIndexProvider = Provider.of<PageIndexProvider>(context);
    return Drawer(
      backgroundColor: const Color(0xff012489),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: const Color(0xffD60A0B),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Image.asset('asset/images/logo.png'), Image.asset('asset/images/menue.png')],
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "asset/images/av_timer.png",
              press: () {
                pageIndexProvider.setPageIndex(0);
              },
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff131F73),
            ),
            ExpansionTile(
              title: const Text(
                "Students",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18, fontFamily: 'Montserrat'),
              ),
              leading: Image.asset("asset/images/students.png"), //add icon
              childrenPadding: const EdgeInsets.only(left: 0), //children padding
              children: [
                DrawerListTile(
                  title: "Add Student",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(1);
                  },
                ),
                DrawerListTile(
                  title: "All Student",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(2);
                  },
                ),

                //more child menu
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff131F73),
            ),
            ExpansionTile(
              title: const Text(
                "Parents",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18, fontFamily: 'Montserrat'),
              ),
              leading: Image.asset("asset/images/people.png"), //add icon
              childrenPadding: const EdgeInsets.only(left: 0), //children padding
              children: [
                DrawerListTile(
                  title: "Add Parents",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(3);
                  },
                ),
                DrawerListTile(
                  title: "All Parents",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(4);
                  },
                ),

                //more child menu
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff131F73),
            ),
            ExpansionTile(
              title: const Text(
                "Teachers",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18, fontFamily: 'Montserrat'),
              ),
              leading: Image.asset("asset/images/std.png"), //add icon
              childrenPadding: const EdgeInsets.only(left: 0), //children padding
              children: [
                DrawerListTile(
                  title: "Add Teacher",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(5);
                  },
                ),
                DrawerListTile(
                  title: "All Teacher",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(6);
                  },
                ),

                //more child menu
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff131F73),
            ),
            ExpansionTile(
              title: const Text(
                "Subject",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18, fontFamily: 'Montserrat'),
              ),
              leading: Image.asset("asset/images/subject.png"), //add icon
              childrenPadding: const EdgeInsets.only(left: 0), //children padding
              children: [
                DrawerListTile(
                  title: "Add Subject",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(7);
                  },
                ),
                DrawerListTile(
                  title: "Assign subjects to class",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(8);
                  },
                ),
                DrawerListTile(
                  title: "Assign subjects to teacher",
                  svgSrc: "",
                  press: () {
                    pageIndexProvider.setPageIndex(9);
                  },
                ),

                //more child menu
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff131F73),
            ),
            ExpansionTile(
              title: const Text(
                "Accounts",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18, fontFamily: 'Montserrat'),
              ),
              leading: Image.asset("asset/images/account.png"), //add icon
              childrenPadding: const EdgeInsets.only(left: 0), //children padding
              children: const [
                //more child menu
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff131F73),
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "asset/images/settings.png",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title;
  final String svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 17),
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: svgSrc != ''
          ? Image.asset(svgSrc
              //"asset/images/edit.png",
              )
          : Icon(Icons.arrow_right),
      minLeadingWidth: 57,
      title: Text(
        title,
        style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 18, fontFamily: 'Montserrat'),
      ),
    );
  }
}
