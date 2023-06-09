
import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../dashboard/components/header.dart';
import '../../dashboard/components/recent_forums.dart';
import '../../dashboard/components/user_details_widget.dart';
import '../../responsive.dart';
import 'dashboard_component/dashboard_component.dart';


class CustomerDashboardScreen extends StatelessWidget {
  const CustomerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              const CustomerMiniInformationCard(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const SizedBox(height: defaultPadding),
                        //showdata(),
                        //RecentUsers(),
                        const SizedBox(height: 50),
                        const RecentDiscussions(),
                        if (Responsive.isMobile(context)) const SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) const UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context)) const SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    const Expanded(
                      flex: 2,
                      child: UserDetailsWidget(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
