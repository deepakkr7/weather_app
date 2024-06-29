
import 'package:flutter/material.dart';

class Historypge extends StatelessWidget {

   Historypge({super.key});
  final List<HistoryItem> historyItems = List.generate(
    20,
        (index) => HistoryItem(day: 'Wednesday', location: 'India', time: '8:37 AM'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'History',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: historyItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      historyItems[index].day,
                      style: TextStyle(color: Colors.blue[800], fontSize: 14),
                    ),
                    Text(
                      historyItems[index].location,
                      style: TextStyle(color: Colors.blue[800], fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      historyItems[index].time,
                      style: TextStyle(color: Colors.blue[800], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HistoryItem {
  final String day;
  final String location;
  final String time;

  HistoryItem({required this.day, required this.location, required this.time});
}

