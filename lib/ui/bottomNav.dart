import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saniologisticdriver/ui/dashboard.dart';
import 'package:saniologisticdriver/ui/idScreen.dart';
import 'package:saniologisticdriver/ui/nearby.dart';
import 'package:saniologisticdriver/ui/points.dart';
import 'package:saniologisticdriver/ui/status.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

int selectedIndex = 0;

class _NavState extends State<Nav> {
  final List<Widget> _widgetOptions = <Widget>[
    const DashBoard(),
    const NearByScreen(),
    const StatusScreen(),
    const IdScreen(),
    const CustomerRewardLedger(),
    // const PreviewBundalPage(),
    // const MyBundalSubscription(),
    // const WallatePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onBack() {
    return check();
  }

  check() {
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Are you sure"),
              content: const Text('Are you sure to quit?'),
              actions: <Widget>[
                TextButton(
                  child:
                      const Text("Stay", style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                    onPressed: () {
                      exit(1);
                    },
                    child: const Text("Quit",
                        style: TextStyle(color: Colors.blue))),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.white,
          selectedItemColor: Colors.green,
          elevation: 0,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xff9e27b0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // backgroundColor: primaryLight,
              icon: Icon(
                Icons.home,
              ),
              label: 'DashBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Near BY',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions,
              ),
              label: 'Id',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              label: 'Wallet',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTap,
          // fixedColor: Colors.orange,
        ),
      ),
    );
  }
}
