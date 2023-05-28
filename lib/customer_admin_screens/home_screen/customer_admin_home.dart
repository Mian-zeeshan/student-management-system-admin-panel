
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/provider/page_index_provider.dart';
import 'package:student_tracking_portal/responsive.dart';

import '../../core/app_config/app_config.dart';
import '../component/customer_admin_side_menu.dart';



class CustomerAdminHomeScreen extends StatelessWidget {
  const CustomerAdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xffF0F1F3),
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
                child: CustomerAdminSideMenue(),
              ),
              // Expanded(
              //   flex: 5,
              //   child: CustomerScreen())
            Consumer<PageIndexProvider>(
              builder: (context, value, child) {
                return Expanded(
                  flex: 5,
                  child: AppConfig.customerAdminPagesList[9],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
