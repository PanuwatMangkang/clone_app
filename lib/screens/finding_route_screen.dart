import 'package:flutter/material.dart';
import 'header.dart';

class FindingRouteScreen extends StatefulWidget {
  @override
  _FindingRouteScreenState createState() => _FindingRouteScreenState();
}

class _FindingRouteScreenState extends State<FindingRouteScreen> {
  int _currentIndex = 0;

  final List<String> stations = [
    'Sukhumvit',
    'Silom',
    'Asok',
    'Mo Chit',
    'Bang Wa',
  ];

  // Sample data for landmarks associated with stations
  final List<Map<String, String>> landmarks = [
    {
      'station': 'Sukhumvit',
      'landmark': 'Terminal 21',
      'description':
          'A popular shopping mall near Sukhumvit station.', // Add placeholder image asset
    },
    {
      'station': 'Silom',
      'landmark': 'Lumphini Park',
      'description': 'A large public park offering a peaceful retreat.',
    },
    {
      'station': 'Asok',
      'landmark': 'Benjakitti Park',
      'description': 'A scenic park ideal for jogging and cycling.',
    },
  ];

  // Content for Finding Route tab
  Widget _buildFindingRouteTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Departure Station Dropdown
          Text(
            'Departure Station',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            items: stations.map((String station) {
              return DropdownMenuItem<String>(
                value: station,
                child: Text(station),
              );
            }).toList(),
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
          SizedBox(height: 16),

          // Destination Station Dropdown
          Text(
            'Destination Station',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            items: stations.map((String station) {
              return DropdownMenuItem<String>(
                value: station,
                child: Text(station),
              );
            }).toList(),
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
          SizedBox(height: 24),

          // Map Image Placeholder
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/map_placeholder.jpg', // Replace with actual map asset
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Content for Station List tab
  Widget _buildStationListTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: stations.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(Icons.train, color: Colors.blue),
            title: Text(stations[index]),
            subtitle:
                Text('Line: MRT Blue Line'), // Replace with actual line data
          ),
        );
      },
    );
  }

  // Content for Landmark tab
  Widget _buildLandmarkTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: landmarks.length,
      itemBuilder: (context, index) {
        final landmark = landmarks[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      landmark['landmark']!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Near ${landmark['station']} Station',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      landmark['description']!,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(), // Use the custom header
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                _buildFindingRouteTab(),
                _buildStationListTab(),
                _buildLandmarkTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            label: 'Finding Route',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Station List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Landmark',
          ),
        ],
      ),
    );
  }
}
