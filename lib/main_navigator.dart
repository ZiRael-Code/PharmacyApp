import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/MainScreen/Dashboard.dart';
import 'package:pharmacy_app/MainScreen/Patients.dart';

import 'MainScreen/Account.dart';
import 'MainScreen/Store.dart';

class MainNavigator extends StatefulWidget {
  final int index;
  MainNavigator({super.key, required this.index});

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  late int _selectedIndex = widget.index;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _screens = [
    Dashboard(onItemTapped: _onItemTapped),
    Patients(),
    Store(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 0
                    ? 'assets/images/s_home.svg'
                    : 'assets/images/un_home.svg',
                width: getFontSize(28, context),
                height: getFontSize(28, context),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 1
                    ? 'assets/images/s_patient.svg'
                    : 'assets/images/un_patient.svg',
                width: getFontSize(28, context),
                height: getFontSize(28, context),
              ),
              label: 'Patients',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 3
                    ? 'assets/images/s_pharmacy.svg'
                    : 'assets/images/un_pharmacy.svg',
                width: getFontSize(28, context),
                height: getFontSize(28, context),
              ),
              label: 'Pharmacy',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectedIndex == 3
                    ? 'assets/images/s_account.svg'
                    : 'assets/images/un_account.svg',
                width: getFontSize(28, context),
                height: getFontSize(28, context),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MainNavigator(index: 0)));
}
