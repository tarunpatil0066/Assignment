import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Morning extends StatefulWidget {
  const Morning({super.key});

  @override
  State<Morning> createState() => _MorningState();
}

class _MorningState extends State<Morning> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Morning 08:00 am',
          style: TextStyle(
              fontSize: screenwidth*0.05,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: screenheight*0.01,),
        SizedBox(
          height: screenheight*0.35,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context ,int index){
                return Card(
                  color: Colors.grey[50],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'Assets/sample.png',
                        ),
                        SizedBox(width: screenwidth*0.03,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Calpol 500mg Tablet',
                              style: TextStyle(
                                  fontSize: screenwidth*0.05,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Before Brekfast day 01',
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(
                              Icons.notification_important,
                              color: Colors.green,
                            ),
                            Text(
                                'Taken'
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
