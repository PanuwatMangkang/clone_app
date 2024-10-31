import 'package:flutter/material.dart';
import './header.dart';

class MoreScreen extends StatelessWidget {
  // Sample data for social media and contact buttons
  final List<Map<String, String>> moreOptions = [
    {'icon': 'assets/Website.png', 'label': 'Website'},
    {'icon': 'assets/facebook.png', 'label': 'Facebook'},
    {'icon': 'assets/twitter.png', 'label': 'Twitter'},
    {'icon': 'assets/instagram.png', 'label': 'Instagram'},
    {'icon': 'assets/youtube.png', 'label': 'YouTube'},
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
                  crossAxisCount: 2, // Two options per row
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: moreOptions.length,
                itemBuilder: (context, index) {
                  final option = moreOptions[index];
                  return Center(
                    child: SizedBox(
                      width: 120, // Fixed width
                      height: 120, // Fixed height
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100], // Light blue background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                option['icon']!,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: Text(
                                option['label']!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blue[900]),
                                textAlign: TextAlign.center,
                              ),
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
