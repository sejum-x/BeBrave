import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const navbarColor = const Color(0xff1E1E26);
const choosenButtonColor = const Color(0xffF5F5F3);
const IdleIconColor = const Color(0xff6A677A);
const ActiveIconColor = const Color(0xff1E1E26);
const MainBackgroundColor = const Color(0xff12121A);

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Main content
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Your main content here
                Container(
                  // Your main content here
                  //child: Text('Home Content'),
                ),
                // Your content based on the selected index
                // Your content based on the selected index
                IndexedStack(
                  index: _selectedIndex,
                  children: List.generate(5, (index) {
                    switch (index) {
                      case 0:
                        return Container(child: Text('Home Content'));
                      case 1:
                        return Container(child: Text('AiCamera Content'));
                      case 2:
                        return Container(child:  Text('Map Content'));
                      case 3:
                        return Container(child: Text('Donate Content'));
                      case 4:
                        return Container(child: Text('Profile Content'));
                      default:
                        return Container(); // Return an empty container for unknown index
                    }
                  }),
                ),

              ],
            ),
            // NavBar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                child: Container(
                  color: navbarColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: GNav(
                      backgroundColor: navbarColor,
                      color: IdleIconColor,
                      activeColor: ActiveIconColor,
                      tabBackgroundColor: choosenButtonColor,
                      gap: 8,
                      onTabChange: _onItemTapped,
                      padding: EdgeInsets.all(16),
                      tabs: [
                        GButton(
                          icon: Icons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.camera_alt_rounded,
                          text: 'AiCamera',
                        ),
                        GButton(
                          icon: Icons.map_rounded,
                          text: 'Map',
                        ),
                        GButton(
                          icon: Icons.attach_money_rounded,
                          text: 'Donate',
                        ),
                        GButton(
                          icon: Icons.person,
                          text: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
