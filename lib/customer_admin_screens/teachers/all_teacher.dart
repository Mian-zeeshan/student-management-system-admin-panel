import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_config/app_config.dart';
import '../../core/models/parent_model/parent_model.dart';
import '../../core/models/student_model/student_model.dart';
import '../component/helper.dart';

class AllTeacher extends StatefulWidget {
  const AllTeacher({super.key});

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<AllTeacher> createState() => _AllTeacherState();
}

class _AllTeacherState extends State<AllTeacher> {
  List<StudentModel> studentModelList = [];
  List<ParentModel> parentModelList = [];
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // ignore: prefer_const_constructors
    return SizedBox(
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
                    const Icon(
                      Icons.search,
                      color: Color(0xffA3A3A3),
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    text('Search', color: const Color(0xffA3A3A3), size: 18, fontfamily: 'Montserrat'),
                    SizedBox(
                      width: size.width * 0.61,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('asset/images/msg.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('asset/images/bell.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('asset/images/line.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('asset/images/profile.png'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, top: 15),
            child:
                text('Teacher', color: Colors.black, size: 22.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, top: 15),
            child: Row(
              children: [
                text('Home',
                    color: const Color(0xff494949), size: 18.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                ),
                text('All Teachers ',
                    color: Colors.red, size: 18.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, right: 29, top: 10),
            child: Container(
              width: size.width,
              height: size.height * 0.7,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    text('All Teacher Data', size: 28.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, right: 40),
                      child: Row(
                        children: [
                          Container(
                            height: 54.0,
                            width: 348,
                            color: const Color(0xFFF2F1F1),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Color(0xff757576)),
                                      hintText: 'Search by name...'),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          
                         
                        ],
                      ),
                    ),
                    Card(
                      shadowColor: Colors.black.withOpacity(0.5),
                      color: const Color(0xFFDDDEEE),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            child: SizedBox(
                              height: 71,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 38, top: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Expanded(
                                        child: Text('Name',
                                            style: TextStyle(
                                                color: Color(0xff060606),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SofiaPro')),
                                      ),
                                      Expanded(
                                        child: Text('Email',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SofiaPro')),
                                      ),
                                      Expanded(
                                        child: Text('Gender',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SofiaPro')),
                                      ),
                                      Expanded(
                                        child: Text('Phone No',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SofiaPro')),
                                      ),
                                      Expanded(
                                        child: Text('CNIC NO',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SofiaPro')),
                                      ),
                                      Expanded(
                                        child: Text('Adress',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'SofiaPro')),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, bottom: 0),
                            child: SizedBox(
                                // height:widget.size.height * 0.3,

                                child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Teacher')
                                  // .where('userRole', isEqualTo: 'admin')
                                  .snapshots(),
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
                                        height: 0,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.white,
                                        child: SizedBox(
                                          height: 71,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 38,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[index]['name'].toString(),
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xff656262),
                                                            fontFamily: 'SofiaPro'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data!.docs[index]['email'].toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff656262),
                                                        fontFamily: 'SofiaPro'),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data!.docs[index]['genderId'].toString() == 'bbcbxcmnnnn12'
                                                        ? 'Male'
                                                        : 'Female',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff656262),
                                                        fontFamily: 'SofiaPro'),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data!.docs[index]['phnNo'].toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff656262),
                                                        fontFamily: 'SofiaPro'),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data!.docs[index]['cnicNo'].toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff656262),
                                                        fontFamily: 'SofiaPro'),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data!.docs[index]['adress'].toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xff656262),
                                                        fontFamily: 'SofiaPro'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            )),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
