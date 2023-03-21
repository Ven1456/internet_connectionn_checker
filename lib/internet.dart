
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Internet extends StatefulWidget {
  const Internet({Key? key}) : super(key: key);

  @override
  State<Internet> createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;
  late StreamSubscription internetConnected;
  late StreamSubscription connected;

  @override
  void initState() {
    super.initState();
    // ON CHANGED BETWEEN MOBILE AND WIFI
    connected = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        this.result = result;
      });
    });
    //ON INTERNET STATUS CHANGE
    internetConnected =
        InternetConnectionChecker().onStatusChange.listen((status) {
          final hasInternet = status == InternetConnectionStatus.connected;

          setState(() {
            this.hasInternet = hasInternet;
          });
        });
  }

  @override
  void dispose() {
    internetConnected.cancel();
    connected.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: HelloConvexAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //button
            ElevatedButton(
              onPressed: () async {
                hasInternet = await InternetConnectionChecker().hasConnection;
                result = await Connectivity().checkConnectivity();
                final color = hasInternet ? Colors.green : Colors.red;
                final text = hasInternet ? "Internet" : "No Internet";
                // MOBILE
                if (result == ConnectivityResult.mobile) {
                  showSimpleNotification(
                    Text(
                      "$text : Mobile",
                    ),
                    background: color,
                  );
                }
                //WIFI
                else if (result == ConnectivityResult.wifi) {
                  showSimpleNotification(
                    Text(
                      "$text : Wifi",
                    ),
                    background: color,
                  );

                  // NOT INTERNET CONNECTED
                } else {
                  showSimpleNotification(
                    Text(
                      text,
                    ),
                    background: color,
                  );
                }
              },
              child: const Text("Check Internet Status"),
            ),
            const SizedBox(
              height: 20,
            ),
            // INTERNET STATUS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hasInternet
                    ? const Icon(Icons.four_g_mobiledata_outlined)
                    : const Icon(Icons.dangerous),
                Text(hasInternet ? "Internet Connected" : "No Internet"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //MOBILE
            if (result == ConnectivityResult.mobile)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.mobile_friendly),
                  Text("Mobile Internet is Connected"),
                ],
              ),
            // WIFI
            if (result == ConnectivityResult.wifi)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.wifi),
                  Text("Wifi is Connected"),
                ],
              ),
            // NO DEVICE CONNECTED
            if (result == ConnectivityResult.none)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.dangerous),
                  Text("No Internet Connected"),
                ],
              ),

          ],
        ),
      ),
      //bottomNavigationBar: HelloConvexAppBar(),
    );
  }
}
// GRID
class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> widgetList = ['A', 'B', 'C'];
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 45) / 2;
    final double itemWidth = size.width / 2;
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: widgetList.map((String value) {
        return  Container(
          // height: 400.0,
          color: Colors.green,
          margin: const EdgeInsets.all(1.0),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontSize: 50.0, color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}
// BOTTOM BAR
class HelloConvexAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      elevation: 5,
      curveSize: 80,
      style: TabStyle.fixedCircle,
      color: Colors.grey,
      activeColor: Colors.blue,
      backgroundColor: Colors.white,
      items: [
        const TabItem(
            icon: Icons.home_outlined, title: "list", activeIcon: Icons.home),
        TabItem(
            icon: CircleAvatar(
              child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 15,
                      spreadRadius: 11.5,
                    )
                  ]),
                  child: const Icon(
                    Icons.add,
                  )),
            ),
            title: "add"),
        const TabItem(
            icon: Icons.file_copy_outlined,
            title: "assessment",
            activeIcon: Icons.file_copy),
      ],
      initialActiveIndex: 0,
      onTap: (int i) => print('click index=$i'),
    );
  }
}

carousel(
    String svgPicture, double height, double width, String text, TextStyle style) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(svgPicture),
      ),
      const SizedBox(height: 20,),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Text(text, textAlign: TextAlign.center, style: style))
    ],
  );
}