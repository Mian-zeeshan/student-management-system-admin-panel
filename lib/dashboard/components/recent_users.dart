
import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';

class RecentUsers extends StatelessWidget {
  const RecentUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Candidates",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              custombutton('standards'),
              custombutton('chapters'),custombutton('SubChapters'),
            ],
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text("Standard"),
                  ),
                  DataColumn(
                    label: Text("Chapter"),
                  ),
                  // DataColumn(
                  //   label: Text("SubChapter"),
                  // ),
                  // DataColumn(
                  //   label: Text("E-mail"),
                  // ),
                  // DataColumn(
                  //   label: Text("Registration Date"),
                  // ),
                  // DataColumn(
                  //   label: Text("Status"),
                  // ),
                  DataColumn(
                    label: Text("Operation"),
                  ),
                ],
                rows: [
 DataRow(cells: [

  DataCell(Text('data')),
   DataCell(Text('data')),
   
   DataCell(Text('data')),

 ])

                ],
                // List.generate(
                //   recentUsers.length,
                //   (index) => recentUserDataRow(recentUsers[index], context),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton custombutton(String text) {
    return ElevatedButton(
    child: Text(
      text.toUpperCase(),
      style: TextStyle(fontSize: 14)
    ),
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.red)
        )
      )
    ),
    onPressed: () => null
  );
  }


}

// DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             TextAvatar(
//               size: 35,
//               backgroundColor: Colors.white,
//               textColor: Colors.white,
//               fontSize: 14,
//               upperCase: true,
//               numberLetters: 1,
//               shape: Shape.Rectangle,
//               text: userInfo.name!,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(
//                 userInfo.name!,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Container(
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: getRoleColor(userInfo.role).withOpacity(.2),
//             border: Border.all(color: getRoleColor(userInfo.role)),
//             borderRadius: BorderRadius.all(Radius.circular(5.0) //
//                 ),
//           ),
//           child: Text(userInfo.role!))),
//       DataCell(Text(userInfo.email!)),
//       DataCell(Text(userInfo.date!)),
//       DataCell(Text(userInfo.posts!)),
//       DataCell(
//         Row(
//           children: [
//             TextButton(
//               child: Text('View', style: TextStyle(color: greenColor)),
//               onPressed: () {},
//             ),
//             SizedBox(
//               width: 6,
//             ),
//             TextButton(
//               child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
//               onPressed: () {
//                 showDialog(
//                     context: context,
//                     builder: (_) {
//                       return AlertDialog(
//                           title: Center(
//                             child: Column(
//                               children: [
//                                 Icon(Icons.warning_outlined,
//                                     size: 36, color: Colors.red),
//                                 SizedBox(height: 20),
//                                 Text("Confirm Deletion"),
//                               ],
//                             ),
//                           ),
//                           content: Container(
//                             color: secondaryColor,
//                             height: 70,
//                             child: Column(
//                               children: [
//                                 Text(
//                                     "Are you sure want to delete '${userInfo.name}'?"),
//                                 SizedBox(
//                                   height: 16,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     ElevatedButton.icon(
//                                         icon: Icon(
//                                           Icons.close,
//                                           size: 14,
//                                         ),
//                                         style: ElevatedButton.styleFrom(
//                                             primary: Colors.grey),
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         label: Text("Cancel")),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     ElevatedButton.icon(
//                                         icon: Icon(
//                                           Icons.delete,
//                                           size: 14,
//                                         ),
//                                         style: ElevatedButton.styleFrom(
//                                             primary: Colors.red),
//                                         onPressed: () {},
//                                         label: Text("Delete"))
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ));
//                     });
//               },
//               // Delete
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
