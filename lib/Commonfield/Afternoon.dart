import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Afternoon extends StatefulWidget {
  const Afternoon({super.key});

  @override
  State<Afternoon> createState() => _AfternoonState();
}

class _AfternoonState extends State<Afternoon> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Afternoon 02:00 pm',
          style: TextStyle(
              fontSize: screenwidth*0.05,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: screenheight*.01,),
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
                          'Assets/sample1.png',
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
                              'After Food        Day01',
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(
                              Icons.notification_important,
                              color: Colors.orange,
                            ),
                            Text(
                                'Snoozed'
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
