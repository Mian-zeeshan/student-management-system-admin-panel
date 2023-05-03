import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:student_tracking_portal/login/provider/login_provider.dart';
import 'package:student_tracking_portal/product_admin_screens/providers/customer_provider.dart';
import 'core/constants/color_constants.dart';
import 'customer_admin_screens/home_screen/customer_admin_home.dart';
import 'provider/user_provider.dart';
import 'provider/page_index_provider.dart';
import 'provider/role_provider.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';

import 'login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB6d-o5Svo95GJ6GBndfV6uiOp0LJi1WbI",
            authDomain: "student-tracking-system-c2524.firebaseapp.com",
            projectId: "student-tracking-system-c2524",
            storageBucket: "student-tracking-system-c2524.appspot.com",
            messagingSenderId: "1063443905522",
            appId: "1:1063443905522:web:e645b1deae9b5c2202896b",
            measurementId: "G-N28CSLYWL7"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

// void main() {

// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse}),
        title: 'Smart Dashboard - Admin Panel v0.1 ',
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: bgColor, elevation: 0),
          scaffoldBackgroundColor: bgColor,
          primaryColor: greenColor,
          dialogBackgroundColor: secondaryColor,
          canvasColor: secondaryColor,
        ),
        home: CustomerAdminHomeScreen(),
      ),
    );
  }
}
