// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Commonfotter extends StatefulWidget {
//   const Commonfotter({super.key});
//
//   @override
//   State<Commonfotter> createState() => _CommonfotterState();
// }
//
// class _CommonfotterState extends State<Commonfotter> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.topCenter,
//       children: [
//         Container(
//           height: 60,
//           padding: EdgeInsets.symmetric(horizontal: 30),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 spreadRadius: 1,
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: Colors.blue,
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(
//                       color: Colors.black
//                     ),
//                   )
//                 ],
//               ),
//               // CircleAvatar(
//               //   backgroundColor: Colors.black,
//               //   child: IconButton(
//               //       onPressed: (){
//               //
//               //       },
//               //       icon: Icon(
//               //         Icons.add,color: Colors.white,
//               //       )
//               //   ),
//               // ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.leaderboard_outlined,
//                     color: Colors.blue,
//                   ),
//                   Text(
//                     'Report',
//                     style: TextStyle(
//                         color: Colors.black
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../Pages/Report.dart';
import 'Drawer.dart';

class CommonFooter extends StatefulWidget {
  const CommonFooter({super.key});

  @override
  State<CommonFooter> createState() => _CommonFooterState();
}

class _CommonFooterState extends State<CommonFooter> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Bottom navigation bar
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(child: Icon(Icons.home, color: Colors.blue,size: 30,)),
                  Text('Home', style: TextStyle(color: Colors.black)),
                ],
              ),
              Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=>Report())
                        );
                      },
                      child:
                      Icon(Icons.leaderboard_outlined, color: Colors.grey,size: 30,)),
                  Text('Report', style: TextStyle(color: Colors.black)),
                ],
              ),
              SizedBox(width: screenwidth*0.1,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=>CommonDrawer())
                        );
                      },
                      child:
                      Icon(Icons.menu, color: Colors.grey,size: 30,)),
                  Text('Menu', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
        // Floating Add Button
        Positioned(
          top: -30, // Raise the button above the container
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}

