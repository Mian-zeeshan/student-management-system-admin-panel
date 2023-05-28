import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/core/models/gender_model/gender_model.dart';
import 'package:student_tracking_portal/core/models/section_model/section_model.dart';
import 'package:student_tracking_portal/customer_admin_screens/customer_provider/subject_provider.dart';
import 'package:student_tracking_portal/customer_admin_screens/home_screen/customer_admin_home.dart';

import '../../core/app_config/app_config.dart';
import '../../core/models/class_model/class_model.dart';
import '../../provider/customer_admin_provider.dart';

class Helper {
  static List<SectionModel> sectionsList = [
    SectionModel(sectionId: 'hmkldkfkf67315138', sectionName: 'A'),
    SectionModel(sectionId: 'hfkkfkf6731568686', sectionName: 'B'),
    SectionModel(sectionId: 'hbebkfkf6731519802', sectionName: 'C'),
    SectionModel(sectionId: 'hvdkfkf673157271', sectionName: 'D'),
    SectionModel(sectionId: 'hbnhdkfkf67315077', sectionName: 'E'),
    SectionModel(sectionId: 'hbeekfkf673151153664', sectionName: 'F'),
  ];

  static List<GenderModel> genderList = [
    GenderModel(gender: 'Male', genderId: 'bbcbxcmnnnn12'),
    GenderModel(gender: 'Female', genderId: 'bbcbxcmnnnn18778'),
  ];
  static List<ClassModel> classList = [
    ClassModel(classId: 'jbkvnlgblh010iuoececerivnvm', className: '6th'),
    ClassModel(classId: 'jbkvnlgblhe204eridevnvm', className: '7th'),
    ClassModel(classId: 'jbkvnl985899rhi2euoerivnvm', className: '8th'),
    ClassModel(classId: 'jbkvnlgblherhiuoerivnvm', className: '9th'),
    ClassModel(classId: 'jbkvnlgblherhiuoerivqwsnvm', className: '10th'),
    ClassModel(classId: 'jbkvnlgblherhiuo2w2erivnvm', className: '11th'),
    ClassModel(classId: 'jbkvnlgblherqsdhiuoerivnvm', className: '12th'),
  ];
  static Widget customTextFeildWithLabel(String title, TextEditingController widgetController, String validateMsg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(title, size: 18.0, color: Colors.black, fontfamily: 'Montserrat', fontWeight: FontWeight.w600),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 216.0,
          height: 49.0,
          color: const Color(0xffDDDEEE),
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(errorBorder: OutlineInputBorder()),
            controller: widgetController,
            validator: (value) {
              if (value!.isEmpty) {
                return validateMsg;
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  static Widget teacherDropDownList(context) {
    // final provider = Provider.of<screenprovider>(context);
    return Container(
      // width: 200,
      // height: 50,
      color: const Color(0xFFF2F1F1),

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Teacher').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData == false) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Consumer<CustomerAdminProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                child: DropdownButtonFormField<String>(
                  decoration:
                      InputDecoration.collapsed(hintText: '', floatingLabelBehavior: FloatingLabelBehavior.never),
                  dropdownColor: Colors.white,
                  isDense: true,
                  hint: text('Select Teacher',
                      size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                  value: value.userName,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'This Field Required*';
                    }
                    return null;
                  },
                  onChanged: (String? newValue) {
                    var result = snapshot.data!.docs.where((element) => element['name'] == newValue);
                    var res = result.first.id.toString();
                    value.setUserUUId(res);
                    value.setUserName(newValue);
                  },
                  items: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                    return DropdownMenuItem<String>(
                      value: data['name'],
                      child: Text(
                        data['name'],
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  static Widget subjectDropDownList(context) {
    // var branchProvider = Provider.of<BranchProvider>(context, listen: false);
    // final provider = Provider.of<screenprovider>(context);
    return Container(
      color: const Color(0xFFF2F1F1),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Subject').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData == false) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Consumer<SubjectProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                child: Container(
                  child: DropdownButtonFormField<String>(
                    decoration:
                        InputDecoration.collapsed(hintText: '', floatingLabelBehavior: FloatingLabelBehavior.never),
                    dropdownColor: Colors.white,
                    isDense: true,
                    hint: text('Select subject',
                        size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                    value: value.subjectName,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'This Field Required*';
                      }
                      return null;
                    },
                    onChanged: (String? newValue) {
                      var result = snapshot.data!.docs.where((element) => element['subjectName'] == newValue);
                      var res = result.first.id.toString();

                      value.setSubjectId(res);
                      value.setSubjectName(newValue!);
                    },
                    items: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                      return DropdownMenuItem<String>(
                        value: data['subjectName'],
                        child: Text(
                          data['subjectName'],
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  static customDropDownWidget(contex, title, Widget dropDown) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(title, size: 18.0, color: Colors.black, fontfamily: 'Montserrat', fontWeight: FontWeight.w600),
        const SizedBox(
          height: 5,
        ),
        Container(width: 216.0, height: 49.0, color: const Color(0xffDDDEEE), child: dropDown)
      ],
    );
  }

  static Widget sectionDropDown(context) {
    return Container(
        // width: 200,
        // height: 50,
        color: const Color(0xFFF2F1F1),
        child: Consumer<CustomerAdminProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration.collapsed(hintText: '', floatingLabelBehavior: FloatingLabelBehavior.never),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'This Field Required*';
                  }
                  return null;
                },
                dropdownColor: Colors.white,
                hint: text('Select Section',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.sectionName,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  var result = sectionsList.where((element) => element.sectionName == newValue);
                  String sectionId = result.first.sectionId.toString();
                  value.setSectionId(sectionId);
                  // provider.setnumericTypeQuestionOptionsLength(0);
                  // provider.setoptionsTypeQuestionOptionsLength(0);

                  value.setSectionName(newValue!);
                },
                items: sectionsList.map((data) {
                  return DropdownMenuItem<String>(
                    value: data.sectionName,
                    child: Text(
                      data.sectionName.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ));
  }

  static Widget genderDropDown(context) {
    return Container(
        // width: 200,
        // height: 50,
        color: const Color(0xFFF2F1F1),
        child: Consumer<CustomerAdminProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButtonFormField<String>(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'This Field Required*';
                  }
                  return null;
                },
                dropdownColor: Colors.white,
                hint: text('Choose',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.genderName,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (String? newValue) {
                  var result = genderList.where((element) => element.gender == newValue);
                  String genderId = result.first.genderId.toString();
                  value.setGenderId(genderId);
                  // provider.setnumericTypeQuestionOptionsLength(0);
                  // provider.setoptionsTypeQuestionOptionsLength(0);

                  value.setGenderName(newValue!);
                },
                items: genderList.map((data) {
                  return DropdownMenuItem<String>(
                    value: data.gender,
                    child: Text(
                      data.gender.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ));
  }

  static Widget classDropDown(context) {
    return Container(
        // width: 200,
        // height: 50,
        color: const Color(0xFFF2F1F1),
        child: Consumer<CustomerAdminProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration.collapsed(hintText: '', floatingLabelBehavior: FloatingLabelBehavior.never),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Required*';
                  }
                  return null;
                },
                dropdownColor: Colors.white,
                hint: text('Select class',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.className,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                
                onChanged: (String? newValue) {
                  var result = classList.where((element) => element.className == newValue);
                  String classId = result.first.classId.toString();
                  value.setclassId(classId);
                  // provider.setnumericTypeQuestionOptionsLength(0);
                  // provider.setoptionsTypeQuestionOptionsLength(0);

                  value.setClassName(newValue!);
                },
                items: classList.map((data) {
                  return DropdownMenuItem<String>(
                    value: data.className,
                    child: Text(
                      data.className.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ));
  }
}
