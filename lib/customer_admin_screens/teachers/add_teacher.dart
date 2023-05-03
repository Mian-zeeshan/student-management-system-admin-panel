import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:intl/intl.dart';

import '../../core/app_config/app_config.dart';
import '../../core/constants/color_constants.dart';

class AddTeacher extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  TextEditingController nameController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    return 
    SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Container(
              height: 70.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xffA3A3A3),
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    text('Search', color: Color(0xffA3A3A3), size: 18, fontfamily: 'Montserrat'),
                    SizedBox(
                      width: size.width * 0.61,
                    ),
                    SizedBox(width: 10,),
                    Image.asset('asset/images/msg.png'),
                     SizedBox(width: 10,),
                    Image.asset('asset/images/bell.png'),
                     SizedBox(width: 10,),
                    Image.asset('asset/images/line.png'),
                     SizedBox(width: 10,),
                    Image.asset('asset/images/profile.png'),
                  ],
                ),
              ),
            ),
          ),
          text('Student', color: Colors.black, size: 22.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
        ],
      ),
    );
  }


}
