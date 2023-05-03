import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../models/daily_info_model.dart';
import '../../responsive.dart';
import 'forms/input_form.dart';
import 'mini_information_widget.dart';

class MiniInformation extends StatelessWidget {
  const MiniInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return FormMaterial();
                    },
                    fullscreenDialog: true));
              },
              icon: const Icon(Icons.add),
              label: const Text(
                "Add New",
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
InformationCard(image: 'asset/images/persons.png',titleName: 'Customers',subTitleName: '2000'),
InformationCard(image: 'asset/images/parents.png',titleName: 'Users',subTitleName: '2000'),
InformationCard(image: 'asset/images/earning.png',titleName: 'Earning',subTitleName: '2000')
,InformationCard(image: 'asset/images/persons.png',titleName: 'Students',subTitleName: '2000')

          ],
        )
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
String image;
String titleName;
String subTitleName;

   InformationCard({super.key,required this.image,required this.titleName,required this.subTitleName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 120,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: [
        Row(
          children: [
            Image.asset(
              image
             // "asset/images/persons.png",
            ),
            Container(
              height: 40,
              child: VerticalDivider(
                thickness: 2,
                color: Color(0xffD60A0B),
              ),
            ),
            Column(
              children: [
                Text(
                  titleName,
                  style: TextStyle(fontSize: 14, color: Color(0xffD9D9D9), fontWeight: FontWeight.w500),
                ),
                Text(
                  subTitleName,
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
// class InformationCard extends StatelessWidget {
//   const InformationCard({
//     Key? key,
//     this.crossAxisCount = 5,
//     this.childAspectRatio = 1,
//   }) : super(key: key);

//   final int crossAxisCount;
//   final double childAspectRatio;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: dailyDatas.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: defaultPadding,
//         mainAxisSpacing: defaultPadding,
//         childAspectRatio: childAspectRatio,
//       ),
//       itemBuilder: (context, index) =>
//           MiniInformationWidget(dailyData: dailyDatas[index]),
//     );
//   }
// }
