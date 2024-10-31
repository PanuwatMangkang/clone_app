import 'package:flutter/material.dart';
import 'header.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(), // Use the custom header
          Expanded(
            child: Column(
              children: [
                Image.asset('assets/banner.png',
                    fit: BoxFit.cover), // Main banner
                SizedBox(height: 20),
                // Center the row of circular icons
                Center(
                  child: Container(
                    height: 100, // Set the height for the row
                    child: ListView(
                      scrollDirection:
                          Axis.horizontal, // Enable horizontal scrolling
                      children: [
                        _buildCircleIcon(context, 'Finding Route', Icons.map),
                        _buildCircleIcon(context, 'Station Info', Icons.info),
                        _buildCircleIcon(context, 'MRT EMV', Icons.credit_card),
                        _buildCircleIcon(
                            context, 'EMV Contactless', Icons.contactless),
                        _buildCircleIcon(context, 'MRT Club', Icons.star),
                        _buildCircleIcon(context, 'MRT Top Up', Icons.upload),
                        _buildCircleIcon(
                            context, 'Ticket', Icons.airplane_ticket),
                        _buildCircleIcon(
                            context, 'First Train', Icons.access_time),
                        _buildCircleIcon(
                            context, 'Last Train', Icons.access_alarm),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          // Define actions for each button
          print('$title tapped');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60, // Width of the circular icon
              height: 60, // Height of the circular icon
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100], // Background color of the circle
              ),
              child: Icon(icon,
                  size: 30, color: Colors.blue[700]), // Icon size and color
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
