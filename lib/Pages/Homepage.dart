import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Commonfield/Afternoon.dart';
import '../Commonfield/Commonfotter.dart';
import '../Commonfield/Morning.dart';
import '../Commonfield/Night.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> dates = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  late ScrollController _scrollController;
  int todayIndex = 0;
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Get today's index
    String today = DateFormat('EEEE').format(DateTime.now());
    todayIndex = dates.indexOf(today);

    // Scroll to center the current day
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
    ///////////////connection////////////////////

    // Listen for internet connectivity changes
    checkInitialConnectivity();

    // ✅ Listen for internet connectivity changes
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.none)) {
        _showNoInternetDialog();
      }
    });

    /////////////////////////////////////////////
  }
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> checkInitialConnectivity() async {
    List<ConnectivityResult> results = await Connectivity().checkConnectivity();
    if (results.contains(ConnectivityResult.none)) {
      _showNoInternetDialog();
    }
  }

  /// ✅ Show an alert when there is no internet
  // void _showNoInternetDialog() {
  //   final screenwidth = MediaQuery.of(context).size.width;
  //   final screenheight = MediaQuery.of(context).size.height;
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(
  //           "Your Device is not connected",
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: screenwidth*0.05
  //         ),
  //       ),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Image.asset(
  //               'Assets/Internetconnection.png',
  //             height: screenheight*0.3,
  //             width: screenwidth*0.3,
  //           ),
  //           Text(
  //               "Connect your device With",
  //             style: TextStyle(
  //               fontSize: screenwidth*0.05,
  //               fontWeight: FontWeight.bold
  //
  //             ),
  //           ),
  //         ],
  //       ),
  //       actionsPadding: EdgeInsets.zero,
  //       actions: [
  //        Row(
  //          children: [
  //            ElevatedButton(
  //              onPressed: (){
  //                Navigator.pop(context);
  //              },
  //              child: Icon(
  //                Icons.bluetooth,
  //                color: Colors.white,
  //              ),
  //              style: ElevatedButton.styleFrom(
  //                  backgroundColor: Colors.blue,
  //                  shape: RoundedRectangleBorder(
  //                      borderRadius: BorderRadius.circular(10)
  //                  )
  //              ),
  //            ),
  //            ElevatedButton(
  //                onPressed: (){
  //                  Navigator.pop(context);
  //                },
  //                child: Icon(
  //                  Icons.wifi,
  //                  color: Colors.white,
  //                ),
  //              style: ElevatedButton.styleFrom(
  //                backgroundColor: Colors.blue,
  //                shape: RoundedRectangleBorder(
  //                  borderRadius: BorderRadius.circular(10)
  //                )
  //              ),
  //            )
  //          ],
  //        )
  //       ],
  //     ),
  //   );
  // }
  void _showNoInternetDialog() {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Center(
          child: Text(
            "Your Device is not connected",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenwidth * 0.05,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'Assets/Internetconnection.png',
              height: screenheight * 0.25,
              width: screenwidth * 0.5,
            ),
            SizedBox(height: 10),
            Text(
              "Connect your device with",
              style: TextStyle(
                fontSize: screenwidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actionsPadding: EdgeInsets.zero, // Remove padding for full-width buttons
        actions: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              children: [
                // Bluetooth Button
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.bluetooth, color: Colors.white, size: 30),
                        ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.white, // Vertical separator line
                ),
                // WiFi Button
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.wifi, color: Colors.white, size: 30),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  void _scrollToToday() {
    double itemWidth = 100; // Approximate width of each item
    double screenWidth = MediaQuery.of(context).size.width;
    double centerPosition = (todayIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

    _scrollController.animateTo(
      centerPosition,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    String today = DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Harry!'
                  ),
                  Text(
                      '5 Medicines Left'
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                  'Assets/Fistedkit1.jpg',
                width: screenwidth*0.1,
                height: screenheight*0.1,
              ),
              SizedBox(width: screenwidth*0.03,),
              CircleAvatar(
                backgroundImage: AssetImage('Assets/image.jpg'),
              )

            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenheight * 0.03),
              // Horizontal ListView for Days of the Week
              SizedBox(
                height: 50,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    bool isToday = index == todayIndex;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: isToday ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          // border: isToday ? Border.all(color: Colors.blue, width: 2) : null,
                        ),
                        child: Center(
                          child: Text(
                            dates[index],
                            style: TextStyle(
                              fontSize: screenwidth*0.04,
                              color: isToday ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Morning(),
              SizedBox(height: screenheight*0.01,),
              Afternoon(),
              SizedBox(height: screenheight*0.01,),
              Night(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonFooter(),
    );
  }
}
