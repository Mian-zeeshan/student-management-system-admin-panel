import 'package:flutter/material.dart';


class menuitem extends StatefulWidget {
  const menuitem({super.key});

  @override
  State<menuitem> createState() => _menuitemState();
}

class _menuitemState extends State<menuitem> {
  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
          
                //   AppConfig.isstd=true;
                // });
              },
              icon: Icon(Icons.add),
              label: Text(
                "Standards",
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
              
              },
              icon: Icon(Icons.add),
              label: Text(
                "Chapters",
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
            
              },
              icon: Icon(Icons.add),
              label: Text(
                "Subchapters",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
