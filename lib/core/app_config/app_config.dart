import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../customer_admin_screens/customer_dashboard.dart/customer_dashboard.dart';
import '../../customer_admin_screens/parents/all_parents.dart';
import '../../customer_admin_screens/students/add_student.dart';
import '../../customer_admin_screens/students/all_student.dart';
import '../../customer_admin_screens/teachers/add_teacher.dart';
import '../../customer_admin_screens/teachers/all_teacher.dart';
import '../../dashboard/dashboard_screen.dart';
import '../../provider/user_provider.dart';
import '../../provider/role_provider.dart';
import '../../product_admin_screens/customer/customer.dart';
import '../../product_admin_screens/customer_admin/customer_admin.dart';

class AppConfig {
  static var productAdminPagesList = [const DashboardScreen(), CustomerScreen(), CustomerAdminScreen()];
  static var customerAdminPagesList = [
    const CustomerDashboardScreen(),
    AddStudent(),
    AllStudent(),
    AllParent(),
    AddTeacher(),
    AllTeacher()
  ];

  static addDataComponent(String collectionName, String docId, Map<String, Object> map, context) {
    FirebaseFirestore.instance.collection(collectionName).doc(docId).set(map).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Insert"),
            content: Text("Successfuly Insert"),
          );
        },
      );
    });
  }

  static Widget customerList(context) {
    return Container(
      // width: 200,
      // height: 50,
      color: const Color(0xFFF2F1F1),

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Customers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData == false) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Consumer<AddUserProvider>(
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                isDense: true,
                hint: text('Choose',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.customerListValue,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),

                // validator: (value) {
                //   if(value?.isEmpty ?? true){
                //     return'This Field Required*';
                //   }
                //   return null;
                // },
                onChanged: (String? newValue) {
                  // await   getcustomerName(newValue!,context);
                  value.setcustomerListValue(newValue!);
                },

                items: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  // value.setcustomerId(data['customer_id'].toString());

                  return DropdownMenuItem<String>(
                    value: data['customer_name'],
                    child: Text(
                      data['customer_name'],
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }

  static Widget rolesList(context) {
    // final provider = Provider.of<screenprovider>(context);
    return Container(
      // width: 200,
      // height: 50,
      color: const Color(0xFFF2F1F1),

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Roles').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData == false) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Consumer<RoleProvider>(
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                isDense: true,
                hint: text('Choose',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.roleListValue,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.black,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),

                // validator: (value) {
                //   if(value?.isEmpty ?? true){
                //     return'This Field Required*';
                //   }
                //   return null;
                // },
                onChanged: (String? newValue) {
                  value.setroleListValue(newValue!);
                },
                items: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                  return DropdownMenuItem<String>(
                    value: data['role_name'],
                    child: Text(
                      data['role_name'],
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

Text text(
  text, {
  color = Colors.black,
  size = 14.0,
  fontWeight = FontWeight.normal,
  fontfamily = '',
  maxLines = 2,
}) {
  return Text(
    text,
    maxLines: 2,
    softWrap: false,
    style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight, fontFamily: fontfamily),
  );
}
