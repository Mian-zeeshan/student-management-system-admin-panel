import 'package:flutter/material.dart';

import '../../core/app_config/app_config.dart';

Widget headerComponent(size){
  return  Card(
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
          );
         
}