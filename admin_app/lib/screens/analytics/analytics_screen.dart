import 'package:admin_app/widgets/analytics/place.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnalyticsScreen(),
  ));
}

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<TabData> _tabsData = [
    TabData(name: 'Regions', count: 10),
    TabData(name: 'Places', count: 20),
    TabData(name: 'Categories', count: 5),
    TabData(name: 'Reviews', count: 15),
    TabData(name: 'Comments', count: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _tabsData.map((tabData) {
          return InkWell(
            onTap: () {
              if (tabData.name == 'Places') {
                // Navigate to the PlaceListScreen when the "Places" tab is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaceListScreen()),
                );
              }
            },
            child: TabCard(name: tabData.name, count: tabData.count),
          );
        }).toList(),
      ),
    );
  }
}

class TabData {
  final String name;
  final int count;

  TabData({required this.name, required this.count});
}

class TabCard extends StatelessWidget {
  final String name;
  final int count;

  TabCard({required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Count: $count',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
