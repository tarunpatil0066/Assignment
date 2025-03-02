import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Commonfield/Drawer.dart';

class Addmedicines extends StatefulWidget {
  const Addmedicines({super.key});

  @override
  State<Addmedicines> createState() => _AddmedicinesState();
}

class _AddmedicinesState extends State<Addmedicines> {
  TextEditingController SearchController = TextEditingController();

  List<String> count =['1','2','3','4','5','6','7','8','9'];
  int selectedIndex = -1;
  int selectedIndex1 = -1;
  int takeCount = 1;
  int totalCount = 1;

  List<Color> colors = [
    Colors.pinkAccent,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.blue
  ];
  DateTime selectedStartDate = DateTime.now();
  DateTime? selectedEndDate;

  // Function to show Date Picker
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = isStartDate ? selectedStartDate : (selectedEndDate ?? DateTime.now());

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          selectedStartDate = pickedDate;
        } else {
          selectedEndDate = pickedDate;
        }
      });
    }
  }
  List<String> Frequency =['Every day','One Day'];
  String? selectedfrequency;

  List<String> Times =['One Time','Two Times','Three Times'];
  String? selectedtimes;

  bool selectedbefore = true;
  bool selectedafter = false;
  bool selectedbeforesleep = false;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenheight*0.03,),
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=>CommonDrawer())
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios,color: Colors.black,)
                  ),
                  SizedBox(width:screenwidth*0.02 ,),
                  Text(
                    'Add Medicines',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenwidth*0.05,
                    ),
                  ),
                  SizedBox(height: screenheight*0.01,),
                ],
              ),
              SizedBox(height: screenheight*0.02,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: TextFormField(
                  controller: SearchController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      prefixIcon: Icon(Icons.search,color: Colors.grey,),
                      suffixIcon: Icon(Icons.mic,color: Colors.grey,),
                      hintText: 'Search Medicines Name',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ),

              ),
              SizedBox(height: screenheight*0.02,),
          SizedBox(
            height: 60, // Set height for horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Make it horizontal
              itemCount: count.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update selected index
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 50, // Set a fixed width for each item
                    margin: EdgeInsets.symmetric(horizontal: 8), // Spacing
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedIndex == index ? Colors.blue : Colors.grey,
                        width: 2, // Highlight thickness
                      ),
                      color: selectedIndex == index ? Colors.blue.withOpacity(0.2) : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        count[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
              SizedBox(height: screenheight*0.02,),
              Text(
                'Colour',
                style: TextStyle(
                  fontSize: screenwidth*0.05,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(colors.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex1 = index; // Update selected index
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: screenwidth * 0.01),
                        padding: EdgeInsets.all(3), // Padding for border effect
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedIndex1 == index ? Colors.blue : Colors.transparent,
                            width: 1, // Border thickness
                          ),
                        ),
                        child: CircleAvatar(
                          radius: screenwidth * 0.08,
                          backgroundColor: colors[index],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Text(
                'Type',
                style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                ),
              ),
              // SizedBox(height: screenheight*0.02,),
              SizedBox(
                width: double.infinity,
                height: screenheight*0.2,
                child: ListView.builder(
                  itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context , int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'Assets/Medicines.png',
                              height: screenheight*0.12,
                              width: screenwidth*0.12,
                            ),
                            Text(
                              'Tablet',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: screenwidth*0.04
                              ),
                            )
                          ],
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Text(
                'Quantity',
                style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey
                          )
                        ),
                        labelText: "Take $takeCount Pill(s)",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenwidth*0.04
                        )
                      ),
                      readOnly: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if (takeCount > 1) takeCount--; // Decrease count
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey
                        )
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (takeCount > 1) takeCount--; // Decrease count
                          });
                        },
                        icon: Icon(Icons.remove, color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(width: screenwidth*0.02,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        takeCount++;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey
                          )
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            takeCount++; // Increase count
                          });
                        },
                        icon: Icon(Icons.add, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenheight*0.02,),
              Text("Total Count",
                style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: totalCount.toDouble(),
                      min: 1,
                      max: 100,
                      divisions: 99,
                      onChanged: (value) {
                        setState(() {
                          totalCount = value.toInt();
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                  Container(
                    width: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text(totalCount.toString().padLeft(2, '0'))),
                  ),
                ],
              ),
              SizedBox(height: screenheight*0.02,),
              Text("Set Date",
                style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Row(
                children: [
                  // Start Date Picker
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('MMM dd, yyyy').format(selectedStartDate),
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  // End Date Picker
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedEndDate != null
                                  ? DateFormat('MMM dd, yyyy').format(selectedEndDate!)
                                  : "End Date",
                              style: TextStyle(fontSize: 16, color: selectedEndDate != null ? Colors.black : Colors.grey),
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenheight*0.02,),
              Text("Frequency of Days",
                style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              DropdownButtonFormField(
                value: selectedfrequency,
                  items: Frequency.map((item)=>DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )).toList(),
                  onChanged: (value){
                  setState(() {
                    selectedfrequency = value;
                  });
                  },
                decoration: InputDecoration(
                  hintText: 'Select Frequency',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey
                    )
                  )
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Text("How many times a Day",
                style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: screenheight*0.01,),
              DropdownButtonFormField(
                value: selectedtimes,
                items: Times.map((item)=>DropdownMenuItem(
                  value: item,
                  child: Text(item),
                )).toList(),
                onChanged: (value){
                  setState(() {
                    selectedtimes = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Select Times',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20
                        ),
                        borderSide: BorderSide(
                            color: Colors.grey
                        )
                    )
                ),
              ),
              SizedBox(
                height: screenheight*0.2,
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (BuildContext context ,int index){
                      return Row(
                        children: [
                          Icon(Icons.timer,color: Colors.grey,),
                          SizedBox(width: screenwidth*0.02,),
                          Text(
                            'Dose 1',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenwidth*0.05,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                         IconButton(
                             onPressed: (){

                             },
                             icon:
                               Icon(Icons.arrow_forward_ios,color: Colors.grey,)

                         )
                        ],
                      );
                    }
                ),
              ),
              SizedBox(height: screenheight*0.02,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            selectedbefore = true;
                            selectedafter = false;
                            selectedbeforesleep = false;
                          });
                        },
                        child: Text(
                          'Before food',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenwidth*0.04
                          ),
                        ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedbefore?Colors.blueAccent[100]:Colors.grey[50],
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20)
                         )
                      ),
                    ),
                    SizedBox(width: screenwidth*0.03,),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          selectedbefore = false;
                          selectedafter = true;
                          selectedbeforesleep = false;
                        });
                      },
                      child: Text(
                        'After Food',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenwidth*0.04
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedafter?Colors.blueAccent[100]:Colors.grey[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    SizedBox(width: screenwidth*0.03,),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          selectedbefore = false;
                          selectedafter = false;
                          selectedbeforesleep = true;
                        });
                      },
                      child: Text(
                        'Before Sleep',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenwidth*0.04
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: selectedbeforesleep?Colors.blueAccent[100]:Colors.grey[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){
                
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenwidth*0.05,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
