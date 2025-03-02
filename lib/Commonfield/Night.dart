import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Night extends StatefulWidget {
  const Night({super.key});

  @override
  State<Night> createState() => _NightState();
}

class _NightState extends State<Night> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Night 09:00 pm',
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
                          'Assets/sample2.png',
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
                              'Before sleep       Day03',
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(
                              Icons.notification_important,
                              color: Colors.yellow,
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
