import 'package:flutter/material.dart';
import 'header.dart';

class PromotionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(), // Use the custom header
          Expanded(
            child: Column(
              children: [
                // Metro Mall Promotions: Circular Icons and Text
                _metroMallPromotions(),
                // Space between sections
                SizedBox(height: 20),
                // Promotional Images Section
                _promotionalImages(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metroMallPromotions() {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: Container(
            height: 100, // Set the height for the row
            child: ListView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              children: [
                _buildCircleIcon('Metro Mall Promotion', Icons.local_offer),
                SizedBox(width: 20),
                _buildCircleIcon('MRT Card Privillage', Icons.local_offer),
                SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _promotionalImages() {
    return GridView.count(
      crossAxisCount: 2, // 2 images per row
      padding: EdgeInsets.all(8),
      shrinkWrap:
          true, // Allow GridView to take up only as much space as needed
      physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView
      children: [
        _buildPromotionalImage(
            'assets/promo1.jpg'), // Replace with your image assets
        _buildPromotionalImage('assets/promo2.jpg'),
        _buildPromotionalImage('assets/promo3.jpg'),
        _buildPromotionalImage('assets/promo4.jpg'),
      ],
    );
  }

  Widget _buildCircleIcon(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
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
    );
  }

  Widget _buildPromotionalImage(String imagePath) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Rounded corners for the image
        child: SizedBox(
          width: 100, // Set the width of the image
          height: 100, // Set the height of the image
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Cover the entire card area
          ),
        ),
      ),
    );
  }
}
