import 'package:flutter/material.dart';

import '../../core/app_config/app_config.dart';

class Helper {
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
            
            decoration:  InputDecoration(errorBorder: OutlineInputBorder(
              
            )),
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
}
