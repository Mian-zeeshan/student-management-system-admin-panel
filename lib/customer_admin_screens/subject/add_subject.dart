import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_dialog.dart';
import '../../core/app_config/app_config.dart';
import '../../core/models/parent_model/parent_model.dart';
import '../../core/models/student_model/student_model.dart';
import '../component/header.dart';
import '../component/helper.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  List<StudentModel> studentModelList = [];
  List<ParentModel> parentModelList = [];
  TextEditingController subjectController = TextEditingController();
  String _searchQuery = '';
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // ignore: prefer_const_constructors
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header
            headerComponent(size),

            Padding(
              padding: const EdgeInsets.only(left: 29, top: 5),
              child: text('Subject',
                  color: Colors.black, size: 22.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29, top: 15),
              child: Row(
                children: [
                  text('Home',
                      color: const Color(0xff494949),
                      size: 18.0,
                      fontWeight: FontWeight.w600,
                      fontfamily: 'Montserrat'),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                  ),
                  text('Add Subject ',
                      color: Colors.red, size: 18.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 29, right: 29, top: 10),
              child: Container(
                width: size.width,
                height: size.height * 0.9,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      text('All Subjects', size: 28.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 40),
                        child: Row(
                          children: [
                            Container(
                              height: 54.0,
                              width: 348,
                              color: const Color(0xFFF2F1F1),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: TextField(
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (value) {
                                      setState(() {
                                        _searchQuery = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Color(0xff757576)),
                                        hintText: 'Search by name...'),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 54.0,
                              width: 348,
                              color: const Color(0xFFF2F1F1),
                              child: Center(
                                child: Helper.classDropDown(context),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                _showCustomDialog(context);
                              },
                              child: Container(
                                child: Center(child: text('Add New Subject', color: Colors.white, size: 20.0)),
                                width: 200,
                                height: 50,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                                          child: Text('Subject Name',
                                              style: TextStyle(
                                                  color: Color(0xff060606),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'SofiaPro')),
                                        ),
                                        Expanded(
                                          child: Text('Teacher',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'SofiaPro')),
                                        ),
                                        Expanded(
                                          child: Text('Class',
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
                                  height: size.height * 0.5,
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('Subject')
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
                                        final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                                        final filteredDocuments = documents.where((document) {
                                          final lowercaseQuery = _searchQuery.toLowerCase();
                                          final lowercaseTitle = document['subjectName'].toString().toLowerCase();
                                          return lowercaseTitle.contains(lowercaseQuery);
                                        }).toList();
                                        return ListView.separated(
                                          itemCount: filteredDocuments.length,
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 0,
                                            );
                                          },
                                          itemBuilder: (context, index) {
                                            final document = filteredDocuments[index];
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
                                                              document['subjectName'].toString(),
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
                                                          '',
                                                          //snapshot.data!.docs[index]['email'].toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color(0xff656262),
                                                              fontFamily: 'SofiaPro'),
                                                        ),
                                                      ),
                                                      Expanded(child: Container()
                                                          //  Text(
                                                          //   snapshot.data!.docs[index]['genderId'].toString() ==
                                                          //           'bbcbxcmnnnn12'
                                                          //       ? 'Male'
                                                          //       : 'Female',
                                                          //   style: const TextStyle(
                                                          //       fontSize: 18,
                                                          //       fontWeight: FontWeight.w400,
                                                          //       color: Color(0xff656262),
                                                          //       fontFamily: 'SofiaPro'),
                                                          // ),
                                                          ),
                                                      Expanded(child: Container()

                                                          // Text(
                                                          //   snapshot.data!.docs[index]['cnicNo'].toString(),
                                                          //   style: const TextStyle(
                                                          //       fontSize: 18,
                                                          //       fontWeight: FontWeight.w400,
                                                          //       color: Color(0xff656262),
                                                          //       fontFamily: 'SofiaPro'),
                                                          // ),
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
                      ),
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        title: 'Add nSubject',
        message: '',
      );
    },
  );
}
