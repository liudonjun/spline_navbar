import 'package:flutter/material.dart';
import 'package:spline_navbar/spline_navbar.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spline Navbar Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF6E7CFF),
          secondary: const Color(0xFF8ACBFF),
          surface: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SplineNavbar(
        items: const [
          SplineNavbarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SplineNavbarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(
              Icons.search_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SplineNavbarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
        selectedIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        borderColor: const Color(0xFF6E7CFF),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        animation: SplineNavbarAnimation.none,
      ),
    );
  }
}
