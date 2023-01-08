import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/home_page.dart';
import 'package:projet/screens/user_info_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User _user;

  int _selectedPageIndex = 0;
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    _user = widget._user;

    _pages = [
      {
        'page': UserInfoScreen(
          user: _user,
        )
      },
      {'page': const HomePage()},
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  _bottomNavigationBarItem(Icon icon, Icon activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      label: label,
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/images/bottom_tab_bar.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedIconTheme:
            const IconThemeData(color: Color.fromRGBO(171, 178, 162, 1)),
        unselectedItemColor: const Color.fromARGB(171, 178, 162, 1),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: _selectPage,
        items: [
          _bottomNavigationBarItem(
            const Icon(Icons.home_outlined),
            const Icon(Icons.home),
            'Home',
          ),
          _bottomNavigationBarItem(
            const Icon(Icons.person_outline_sharp),
            const Icon(Icons.person),
            'My Profile',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      extendBody: true,
      bottomNavigationBar: _createBottomNavigationBar(),
      body: _pages![_selectedPageIndex]['page'] as Widget,
    );
  }
}
