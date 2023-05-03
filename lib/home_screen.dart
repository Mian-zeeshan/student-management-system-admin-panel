
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/provider/page_index_provider.dart';
import 'package:student_tracking_portal/responsive.dart';

import 'core/app_config/app_config.dart';
import 'dashboard/components/forms/components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      
      
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
              // Expanded(
              //   flex: 5,
              //   child: CustomerScreen())
            Consumer<PageIndexProvider>(
              builder: (context, value, child) {
                return Expanded(
                  flex: 5,
                  child: AppConfig.productAdminPagesList[0],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
