import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/core/models/gender_model/gender_model.dart';
import 'package:student_tracking_portal/core/models/section_model/section_model.dart';
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
    ClassModel(classId: 'jbkvnlgblh010iuoerivnvm', className: '6th'),
    ClassModel(classId: 'jbkvnlgblhe204erivnvm', className: '7th'),
    ClassModel(classId: 'jbkvnl985899rhiuoerivnvm', className: '8th'),
    ClassModel(classId: 'jbkvnlgblherhiuoerivnvm', className: '9th'),
    ClassModel(classId: 'jbkvnlgblherhiuoerivnvm', className: '10th'),
    ClassModel(classId: 'jbkvnlgblherhiuoerivnvm', className: '11th'),
    ClassModel(classId: 'jbkvnlgblherhiuoerivnvm', className: '12th'),
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
            decoration: InputDecoration(errorBorder: OutlineInputBorder()),
            controller: widgetController,
            validator: (value) {
              if (value!.isEmpty) {
                return validateMsg;
              }
            },
          ),
        )
      ],
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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                hint: text('Choose',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.sectionName,
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
                      style: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black),
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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                hint: text('Choose',
                    size: 16.0, fontfamily: 'SofiaPro', fontWeight: FontWeight.w400, color: Colors.black),
                value: value.className,
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
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ));
  }
}
