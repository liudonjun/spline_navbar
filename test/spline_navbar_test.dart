import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spline_navbar/spline_navbar.dart';

void main() {
  testWidgets('SplineNavbar renders and responds to tap', (tester) async {
    var tappedIndex = -1;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: SplineNavbar(
            items: [
              SplineNavbarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
              ),
              SplineNavbarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search_rounded),
              ),
              SplineNavbarItem(
                icon: Icon(Icons.calendar_today_outlined),
                activeIcon: Icon(Icons.calendar_today),
              ),
              SplineNavbarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
              ),
            ],
            selectedIndex: 0,
            onTap: (index) => tappedIndex = index,
            backgroundColor: Colors.black,
            borderColor: Colors.white,
            shadowColor: Colors.black45,
            animation: SplineNavbarAnimation.slide,
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(tappedIndex, 1);
  });
}
