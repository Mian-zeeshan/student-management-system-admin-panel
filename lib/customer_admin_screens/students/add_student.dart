import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/provider/customer_admin_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:intl/intl.dart';

import '../../core/app_config/app_config.dart';
import '../../core/constants/color_constants.dart';
import '../../core/models/parent_model/parent_model.dart';
import '../../core/models/student_model/student_model.dart';
import '../../firebase/crud/Firebase_crud.dart';
import '../component/helper.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController stdNameController = TextEditingController();
  TextEditingController stdRollController = TextEditingController();
  TextEditingController stdEmailController = TextEditingController();
  TextEditingController stdPasswordController = TextEditingController();
  TextEditingController parentEmailController = TextEditingController();
  TextEditingController parentPasswordController = TextEditingController();
  TextEditingController parentPhnNoController = TextEditingController();
  TextEditingController parentCnicController = TextEditingController();
  TextEditingController parentAdressController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController CNICNoController = TextEditingController();
  TextEditingController fatgherCNICNoController = TextEditingController();

  List<StudentModel> studentModelList = [];
  List<ParentModel> parentModelList = [];
  @override
  void dispose() {
    CNICNoController.dispose();
    fatgherCNICNoController.dispose();
    stdNameController.dispose();
    stdRollController.dispose();
    stdEmailController.dispose();
    stdPasswordController.dispose();
    parentEmailController.dispose();
    parentPasswordController.dispose();
    parentPhnNoController.dispose();
    parentCnicController.dispose();
    parentAdressController.dispose();
    parentNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                text('Student', color: Colors.black, size: 22.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
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
                text('Student Admit Form',
                    color: Colors.red, size: 18.0, fontWeight: FontWeight.w600, fontfamily: 'Montserrat'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, right: 29, top: 20),
            child: Container(
              width: size.width,
              height: size.height * 0.7,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      text('Add New Students',
                          color: Colors.black, size: 26.0, fontWeight: FontWeight.bold, fontfamily: 'Montserrat'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Helper.customTextFeildWithLabel('Name *', stdNameController, 'Enter student name'),
                          Helper.customTextFeildWithLabel('Roll No *', stdRollController, 'Enter student roll no'),
                          Helper.customDropDownWidget(context, 'Gender *', Helper.genderDropDown(context)),
                          Helper.customDropDownWidget(context, 'Class *', Helper.classDropDown(context)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Helper.customDropDownWidget(context, 'Section *', Helper.sectionDropDown(context)),
                          Helper.customTextFeildWithLabel('Email *', stdEmailController, 'Enter student email'),
                          Helper.customTextFeildWithLabel(
                              'Password *', stdPasswordController, 'Enter student password'),
                          Helper.customTextFeildWithLabel('CNIC# *', CNICNoController, 'Enter CNIC number'),
                          // Container(
                          //   width: 216,
                          //   height: 49,
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Helper.customTextFeildWithLabel(
                              'Father CNIC# *', fatgherCNICNoController, 'Father CNIC number'),
                          // Container(
                          //   width: 216,
                          //   height: 49,
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: size.width * 0.6),
                        child: InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await FirebaseCrud().regesterStudent(stdEmailController, stdPasswordController, context);
                              await addStudentDateIntoFirestore();
                            }
                          },
                          child: Container(
                            child: Center(child: text('Save', color: Colors.white, size: 20.0)),
                            width: 250,
                            height: 50,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future addStudentDateIntoFirestore() async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String nowDate = formatter.format(now);

    var studentProvider = Provider.of<CustomerAdminProvider>(context, listen: false);
    String? studentId = studentProvider.studentId;

    List<StudentModel> studentList = [];
    studentList.add(StudentModel(
        studentId: studentId,
        name: stdNameController.text.toString().toLowerCase(),
        rollNo: stdRollController.text.toLowerCase().toString(),
        gender: studentProvider.genderId,
        className: studentProvider.classId,
        classSection: studentProvider.sectionId,
        email: stdEmailController.text.toLowerCase().toString(),
        password: stdPasswordController.text.toString(),
        CNIC: CNICNoController.text.toString(),
        fatherCNIC: fatgherCNICNoController.text.toString(),
        createdAt: nowDate,
        createdBy: 'Admin'));

   await  FirebaseCrud().setDocumentData(studentList[0].toJson(), 'Student', studentId).then((value) =>     studentList.clear());

  }
}
