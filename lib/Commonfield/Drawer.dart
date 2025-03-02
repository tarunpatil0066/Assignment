import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/Addmedicines.dart';
import '../Pages/Homepage.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({super.key});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenheight*0.04,),
              IconButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context)=>Homepage())
                    );
                  },
                  icon: Icon(Icons.arrow_back_ios,color: Colors.black,)
              ),
              // SizedBox(height: screenheight*0.02,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: screenwidth*0.1,
                      backgroundImage: AssetImage(
                          'Assets/image1.jpg',
                      ),
                    ),
                    SizedBox(width: screenwidth*0.03,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Take Care!',
                          style: TextStyle(
                            fontSize: screenwidth*0.04,
                          ),
                        ),
                        Text(
                            'Richa Bose',
                          style: TextStyle(
                            fontSize: screenwidth*0.05,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              // SizedBox(height: screenheight*0.01,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: screenwidth*0.05,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.notifications_active_outlined,color: Colors.grey,size: screenwidth*0.1,)
                    ),
                    SizedBox(width: screenwidth*0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: screenwidth*0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenheight*0.01,),
                        Text(
                          'Check your medicine notification',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenwidth*0.045,
                            // fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.volume_up,color: Colors.grey,size: screenwidth*0.1,)
                    ),
                    SizedBox(width: screenwidth*0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sound',
                          style: TextStyle(
                            fontSize: screenwidth*0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenheight*0.01,),
                        Text(
                          'Ring, Silent, Vibrate',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenwidth*0.045,
                            // fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.person,color: Colors.grey,size: screenwidth*0.1,)
                    ),
                    SizedBox(width: screenwidth*0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manage your Account',
                          style: TextStyle(
                            fontSize: screenwidth*0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenheight*0.01,),
                        Text(
                          'Password, Email ID, Phone Number',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenwidth*0.045,
                            // fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Device',
                  style: TextStyle(
                    fontSize: screenwidth*0.05,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.grey[50],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){

                                },
                                icon: Icon(Icons.volume_up,color: Colors.grey,size: screenwidth*0.1,)
                            ),
                            SizedBox(width: screenwidth*0.02,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Connect',
                                  style: TextStyle(
                                    fontSize: screenwidth*0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenheight*0.01,),
                                Text(
                                  'Bluetooth, Wi-Fi',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenwidth*0.045,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: screenheight*0.02,),
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){

                                },
                                icon: Icon(Icons.volume_up,color: Colors.grey,size: screenwidth*0.1,)
                            ),
                            SizedBox(width: screenwidth*0.02,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sound Option',
                                  style: TextStyle(
                                    fontSize: screenwidth*0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenheight*0.0,),
                                Text(
                                  'Ring, Silent, Vibrate',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenwidth*0.045,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Caretaker: 03',
                  style: TextStyle(
                    fontSize: screenwidth*0.05,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: screenheight*0.2,
                  child: Card(
                    color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper spacing
                        children: [
                          // Expanded ensures ListView takes available space
                          Expanded(
                            child: SizedBox(
                              height: screenheight * 0.3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: screenwidth * 0.07,
                                          backgroundImage: AssetImage('Assets/image2.jpg'), // Fixed path
                                        ),
                                        SizedBox(height: screenheight * 0.01),
                                        Text(
                                          'Dipa Luna',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenwidth * 0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Add Button inside CircleAvatar
                          SizedBox(width: screenwidth*0.02,),
                           Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: screenwidth * 0.07,
                                  child: IconButton(
                                    onPressed: () {
                                      // Action when pressed
                                    },
                                    icon: Icon(Icons.add, color: Colors.grey),
                                  ),
                                ),
                                SizedBox(height: screenheight*0.01,),
                                Text(
                                  'Add',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenwidth * 0.04,
                                  ),
                                ),
                              ],
                            ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Doctor',
                  style: TextStyle(
                    fontSize: screenwidth*0.05,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: screenwidth * 0.07,
                            child: IconButton(
                                onPressed: (){

                                },
                                icon: Icon(Icons.add,color: Colors.white,)
                            )
                          ),
                          Text(
                            'Add your Doctor',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenwidth*0.045
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'or use',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenwidth*0.04
                                ),
                              ),
                              SizedBox(width: screenwidth*0.02,),
                              Text(
                                'invite link',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenwidth*0.04,
                                  color: Colors.orange
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontSize: screenwidth*0.05,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(
                        fontSize: screenwidth*0.05,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Rate Us',
                    style: TextStyle(
                        fontSize: screenwidth*0.05,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Share',
                    style: TextStyle(
                        fontSize: screenwidth*0.05,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>Addmedicines())
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Add Medicines',
                    style: TextStyle(
                        fontSize: screenwidth*0.05,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                  
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenwidth*0.04,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.blue
                        )
                      )
                    ),
                  ),
                ),
              )



            ],
          ),

      ),
    );
  }
}
