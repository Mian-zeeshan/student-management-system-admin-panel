import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/customer_admin_screens/customer_provider/subject_provider.dart';
import 'package:student_tracking_portal/firebase/crud/Firebase_crud.dart';

import '../../common/common.dart';
import '../../core/app_config/app_config.dart';
import '../../provider/customer_admin_provider.dart';
import '../component/helper.dart';



class SubjectAssignDialog extends StatelessWidget {
  final String title;
  final String message;

  SubjectAssignDialog({required this.title, required this.message});
  final TextEditingController subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16.0),
          Helper.customDropDownWidget(context, 'Select class *', Helper.classDropDown(context)),
          const SizedBox(height: 10.0),
          Helper.customDropDownWidget(context, 'Select subject *', Helper.subjectDropDownList(context)),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              String uniqueId = generateUniqueID();
              var subjectProvider = Provider.of<SubjectProvider>(context, listen: false);
              var customerAdminProvider = Provider.of<CustomerAdminProvider>(context, listen: false);

              FirebaseCrud().setDocumentData(
                  {'id': uniqueId, 'subjectId': subjectProvider.subjectId, 'classId': customerAdminProvider.classId},
                  'AssignSubject',
                  uniqueId).then((value) => Navigator.pop(context));
            },
            child: Container(
              width: 100,
              height: 50,
              color: Colors.black,
              child: Center(child: text('Save', color: Colors.white, size: 20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
