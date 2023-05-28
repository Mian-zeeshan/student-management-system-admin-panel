import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/provider/customer_admin_provider.dart';

import 'package:intl/intl.dart';

import '../../common/common.dart';
import '../../core/app_config/app_config.dart';
import '../../core/models/parent_model/parent_model.dart';
import '../../core/models/student_model/student_model.dart';
import '../../core/models/teacher_model/teacher_model.dart';
import '../../firebase/crud/Firebase_crud.dart';
import '../component/header.dart';
import '../component/helper.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  // ignore: prefer_typing_uninitialized_variables

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  TextEditingController teacherEmailController = TextEditingController();
  TextEditingController teacherPasswordController = TextEditingController();
  TextEditingController teacherPhnNoController = TextEditingController();
  TextEditingController teacherCnicController = TextEditingController();
  TextEditingController teacherAdressController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();

  List<StudentModel> studentModelList = [];
  List<ParentModel> parentModelList = [];
  @override
  void dispose() {
    teacherEmailController.dispose();
    teacherPasswordController.dispose();
    teacherPhnNoController.dispose();
    teacherCnicController.dispose();
    teacherAdressController.dispose();
    teacherNameController.dispose();
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
          headerComponent(size),
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
                text('Add Teacher',
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
                      text('Add New Teacher',
                          color: Colors.black, size: 26.0, fontWeight: FontWeight.bold, fontfamily: 'Montserrat'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Helper.customTextFeildWithLabel('Name *', teacherNameController, 'Enter teacher name'),
                          Helper.customDropDownWidget(context, 'Gender *', Helper.genderDropDown(context)),
                          Helper.customTextFeildWithLabel('Email *', teacherEmailController, 'Enter parent email'),
                          Helper.customTextFeildWithLabel(
                              'Password *', teacherPasswordController, 'Enter student password'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Helper.customTextFeildWithLabel('CNIC# *', teacherCnicController, 'Enter Phn No #'),
                          Helper.customTextFeildWithLabel('Phn No *', teacherPhnNoController, 'Enter Phn No #'),
                          Helper.customTextFeildWithLabel('Adress *', teacherAdressController, 'Enter Adress'),
                          SizedBox(
                            width: 216,
                            height: 49,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: size.width * 0.6),
                        child: InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await FirebaseCrud()
                                  .regesterUserInFireAuth(teacherEmailController, teacherPasswordController, context);
                              await addUserDateIntoFirestore().then((value) {
                                clearController();
                                showAlertDialog(context, 'Sucessfully Added');
                              });
                            }
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            color: Colors.black,
                            child: Center(child: text('Save', color: Colors.white, size: 20.0)),
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

  Future addUserDateIntoFirestore() async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String nowDate = formatter.format(now);

    var studentProvider = Provider.of<CustomerAdminProvider>(context, listen: false);
    String? teacherId = studentProvider.UserUUId;
    List<TeacherModel> teacherList = [];
    teacherList.add(TeacherModel(
        teacherId: teacherId,
        name: teacherNameController.text.toLowerCase().toString(),
        email: teacherEmailController.text.toLowerCase().toString(),
        password: teacherPasswordController.text.toLowerCase().toString(),
        adress: teacherAdressController.text.toLowerCase().toString(),
        cnicNo: teacherCnicController.text.toString(),
        phnNo: teacherPhnNoController.text.toLowerCase().toString(),
        genderId: studentProvider.genderId,
        createdAt: nowDate,
        createdBy: 'Admin'));

    await FirebaseCrud()
        .setDocumentData(teacherList[0].toJson(), 'Teacher', teacherId)
        .then((value) => teacherList.clear());
  }

  void clearController() {
    teacherEmailController.clear();
    teacherPasswordController.clear();
    teacherPhnNoController.clear();
    teacherCnicController.clear();
    teacherAdressController.clear();
    teacherNameController.clear();
  }
}
