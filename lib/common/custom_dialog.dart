import 'package:flutter/material.dart';
import 'package:student_tracking_portal/firebase/crud/Firebase_crud.dart';

import '../core/app_config/app_config.dart';
import '../customer_admin_screens/component/helper.dart';
import 'common.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;

  CustomDialog({required this.title, required this.message});
  TextEditingController subjectController = TextEditingController();
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
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 16.0),
          Helper.customTextFeildWithLabel('Name *', subjectController, 'Enter student name'),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              bool isDublicate = await FirebaseCrud.checkDuplicateData(
                  'subjectName', subjectController.text.toLowerCase().toString(), 'Subject');
              if (!isDublicate) {
                String uniqueId = generateUniqueID();

                FirebaseCrud().setDocumentData(
                    {'id': uniqueId, 'subjectName': subjectController.text.toLowerCase().toString()},
                    'Subject',
                    uniqueId).then((value) {Navigator.pop(context); showAlertDialog(context,'Sucessfuly insert');} );
              }
              else{
                Navigator.pop(context);
                showAlertDialog(context,'Dublicate error');
              }
            },
            child: Container(
              child: Center(child: text('Save', color: Colors.white, size: 20.0)),
              width: 100,
              height: 50,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}



