import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Commonfield/Afternoon.dart';
import '../Commonfield/Morning.dart';
import '../Commonfield/Night.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  List<String> date =['SUN','MON','TUS','WED','THU','FRI','SAT'];

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    int currentDayIndex = DateTime.now().weekday % 7; // Adjusting for Sunday start
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenheight*0.03,),
              Text(
                'Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenwidth*0.055,
                ),
              ),
              SizedBox(height: screenheight*0.01,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Report",
                        style: TextStyle(
                          fontSize: screenwidth*0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenheight*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenwidth*0.055,
                                ),
                              ),
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenwidth*0.055,
                                ),
                              ),
                              Text(
                                'Taken',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenwidth*0.055,
                                ),
                              ),
                              Text(
                                'Missed',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenwidth*0.055,
                                ),
                              ),
                              Text(
                                'Snoozed',
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              )
                            ],
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check Dashboard',
                        style: TextStyle(
                          fontSize: screenwidth*0.05,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Here you will find everything related to your active and past medicines.',
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                          ),
                          Image.asset(
                            'Assets/spinnergraf.png'
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Row(
                children: [
                  Text(
                    'Check History',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenwidth*0.05,

                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: screenwidth*0.07,
                      )
                  )
                ],
              ),
              SizedBox(height: screenheight*0.02,),
              SizedBox(
                height: screenheight * 0.1, // Set height for horizontal scrolling
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: date.length,
                  itemBuilder: (context, index) {
                    bool isToday = index == currentDayIndex;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: isToday ? Colors.blue : Colors.grey[300],
                            child: Text(
                              '${index + 1}', // Display index +1 inside CircleAvatar
                              style: TextStyle(
                                color: isToday ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            date[index], // Day Name
                            style: TextStyle(
                              color: isToday ? Colors.blue : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenheight*0.01,),
              Morning(),
              SizedBox(height: screenheight*0.01,),
              Afternoon(),
              SizedBox(height: screenheight*0.01,),
              Night(),

            ],
          ),
        ),
      ),
    );
  }
}
