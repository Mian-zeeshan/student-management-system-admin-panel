import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:intl/intl.dart';

import '../../core/app_config/app_config.dart';
import '../../core/constants/color_constants.dart';

class CustomerScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: prefer_const_constructors
    return 
     SizedBox(      height: size.height,
      width: size.width,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 10,right: 10),
             child: Container(
                  height: 80,
                  color: secondaryColor,
                ),
           ),
        

          const SizedBox(
            height: 10,
          ),
            Padding(
             padding: const EdgeInsets.only(left: 100, right: 100),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: secondaryColor,
                shadowColor: Colors.black.withOpacity(0.5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38, top: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Customer',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Montserrat'),
                          ),
                          InkWell(
                            onTap: () {
                              _addCustomerDialog(context);
                              // _addBranchDialog(context);
                              // _addUserDialog(context);
                            },
                            child: Container(
                              width: 131,
                              height: 39,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                color: const Color(0xff060606),
                                border: Border.all(
                                  color: const Color(0xff060606),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '+ Add',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 38, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text('Customer',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat')
                                    
                                    ),
                          ),
                          Expanded(
                            child: Text('Created By',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat')),
                          ),
                          Expanded(
                            child: Text('Created On',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat')),
                          ),
                          Expanded(
                            child: Text('Action',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat')),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 20),
                      child: SizedBox(
                          height: size.height * 0.5,
                          width: size.width,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('Customers').snapshots(),
                            builder: (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CupertinoActivityIndicator());
                              } else if (snapshot.hasData == false) {
                                return const Center(
                                  child: Text(
                                    'Data not found',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                );
                              } else {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                   height: 20,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Divider(
                                    color: bgColor,
                                    thickness: 0.8,
                                  ),
                                ),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data!.docs[index]['customer_name'].toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffABADB7),
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.docs[index]['created_by'].toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffABADB7),
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.docs[index]['created_at'].toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffABADB7),
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Image.asset(
                                              "asset/images/delete.png",
                                            ),
                                            SizedBox(width: 27.0,),
                                            Image.asset(
                                              "asset/images/edit.png",
                                            )
                                          ],
                                        ))
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  
  
  
  }

  Future<void> _addCustomerDialog(
    context,
    //String title,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return SizedBox(
          width: 400,
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: text('Add Customer', size: 24.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400)),
                      const SizedBox(
                        height: 5,
                      ),
                      text('Name', size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400),
                      Container(
                        color: const Color(0xFFF2F1F1),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter  name',
                            hintStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFABAAAA),
                                fontFamily: 'SofiaPro'),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFF2F1F1))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: SizedBox(
                          height: 48,
                          width: 116,
                          child: MaterialButton(
                            color: const Color(0xFF060606),
                            onPressed: () async {
                              var now = DateTime.now();
                              var formatter = DateFormat('yyyy-MM-dd');
                              String nowDate = formatter.format(now);
                              var uuid = const Uuid().v4();
                              AppConfig.addDataComponent(
                                  'Customers',
                                  uuid,
                                  {
                                    'customer_id': uuid,
                                    'customer_name': nameController.text.toLowerCase().toString(),
                                    'created_at': nowDate,
                                    'created_by': 'Admin'
                                  },
                                  context);
                              // _signUp(uuid, nowDate);
                            },
                            child: Center(
                              child: text('Add',
                                  size: 20, color: Colors.white, fontWeight: FontWeight.w400, fontfamily: 'SofiaPro'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void clearControllers() {
    nameController.clear();
  }
}
