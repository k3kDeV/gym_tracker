import 'package:flutter/material.dart';
import 'package:gym_tracker/pages/home_page.dart';
import 'package:gym_tracker/pages/trainings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static int _selectedIndex = 1;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //New
  void _onItemTapped(int index) {
    setState(
      () {
        MyApp._selectedIndex = index;
      },
    );
  }

  List pages = [const HomePage(), const TrainingsPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GYM TRACKER",
      /*theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 85, 84, 84),
      ),*/
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: customAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          unselectedItemColor: Colors.grey[200],
          selectedItemColor: Colors.deepPurple[800],
          currentIndex: MyApp._selectedIndex, //New
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Trainings",
              icon: Icon(Icons.calendar_month),
            ),
          ],
        ),
        body: pages[MyApp._selectedIndex],
      ),
    );
  }
}

AppBar customAppBar() {
  return AppBar(
    backgroundColor: Colors.grey[900],
    centerTitle: true,
    title: const Text("GYM TRACKER"),
  );
}
