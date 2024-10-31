import 'package:flutter/material.dart';
import './header.dart';

class BasicInformationScreen extends StatelessWidget {
  // Sample data for buttons with icons and labels
  final List<Map<String, String>> infoButtons = [
    {'icon': 'assets/icon1.png', 'label': 'Ticket'},
    {'icon': 'assets/icon2.png', 'label': 'First/Last Train Schedule'},
    {'icon': 'assets/icon3.png', 'label': 'Parking Lot'},
    {'icon': 'assets/icon4.png', 'label': 'Fare'},
    {'icon': 'assets/icon5.png', 'label': 'Ticket Conditions'},
    {'icon': 'assets/icon6.png', 'label': 'Safty trip'},
    {'icon': 'assets/icon7.png', 'label': 'Updated News'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(), // Use the custom header
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two buttons per row
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: infoButtons.length,
                itemBuilder: (context, index) {
                  final button = infoButtons[index];
                  return Center(
                    child: SizedBox(
                      width: 200, // Fixed width
                      height: 150, // Fixed height
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100], // Light blue background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon Image
                            Image.asset(
                              button['icon']!,
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(height: 8), // Space between icon and text
                            // Label
                            Text(
                              button['label']!,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blue[900]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
