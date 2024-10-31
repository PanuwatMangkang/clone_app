import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
        children: [
          Image.asset(
            'assets/mrt_icon.png', // Replace with your icon asset
            height: 40, // Set desired height
            width: 40, // Set desired width
          ),
          SizedBox(width: 8), // Space between icon and text
          Text(
            'Bangkok MRT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
