import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/community/community_screen.dart';
import 'package:flutter_application_1/screens/community_page.dart';
import 'package:flutter_application_1/screens/courses/courses_screen.dart';
import 'package:flutter_application_1/screens/courses/my_courses_screen.dart';
import 'package:flutter_application_1/screens/iot/projects_screen.dart';
import 'package:flutter_application_1/screens/products/products_page.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    MyCoursesScreen(),
    CoursesScreen(),
    CommunityScreen(),
    ProductsPage(),
    ProjectsScreen()
  ];

  List<Widget> widgetListTitle = const [
    Text('Home'),
    Text('Courses'),
    Text('Community'),
    Text('Products'),
    Text('IoT Projects')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grow Easy', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 3.0),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              //ir a profile screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          )
        ]
      ),
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 53, 146, 56),
        onTap: (index){
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'Projects',
          ),
        ],
      ),
    );
  }
}