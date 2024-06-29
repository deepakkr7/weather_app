import 'package:flutter/material.dart';
import 'package:weatherapp/history_page.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) toggleDarkMode;
  HomePage({super.key,required this.isDarkMode,required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp',style: TextStyle(color: Colors.amber),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: isDarkMode ? Colors.white : Colors.black),
        actions: [
          Icon(Icons.search,color: Colors.amber,)
        ],
      ),
      drawer: Drawer(
        child:  ListView(
            padding: EdgeInsets.only(top: 30),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.history, color: isDarkMode ? Colors.white : Colors.black),
                    title: Text('History', style: TextStyle(color:  isDarkMode ? Colors.white : Colors.black)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Historypge()));
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.dark_mode, color: isDarkMode ? Colors.white : Colors.black),
                title: Text('Dark mode', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (bool value) {
                    toggleDarkMode(value);
                  },
                  activeColor: Colors.lightBlue,
                ),
              ),
            ],
          ),
        ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IN | Kottakkal',style: TextStyle(fontSize: 24),),
            Text('Scattered clouds',style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('34°',style: TextStyle(fontSize: 80)),
                Icon(Icons.cloud,color: Colors.white,size:80,)
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.thermostat),Text('34°')],),
                  Column(children: [Icon(Icons.water_drop),Text('49%')],),
                  Column(children: [Icon(Icons.air),Text('3 Km/h')],),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Today',style: TextStyle(color: Colors.amber),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _hourlyForecast('09:00AM', '34°', Icons.cloud),
                _hourlyForecast('12:00PM', '33°', Icons.cloud),
                _hourlyForecast('04:00PM', '34°', Icons.cloud),
              ],
            ),
            SizedBox(height: 20),
            Text('5 Day Forecast', style: TextStyle(color: Colors.amber)),
            SizedBox(height: 10),
            _dailyForecast('Wed', '26°', Icons.cloud),
          ],
        ),
      ),
    );
  }
  Widget _hourlyForecast(String time, String temp, IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(time),
          Text(temp, style: TextStyle(fontSize: 24)),
          Icon(icon),
          Row(children: [Icon(Icons.water_drop, size: 14), Text('49%')]),
          Row(children: [Icon(Icons.air, size: 14), Text('3 km/h')]),
        ],
      ),
    );
  }
  Widget _dailyForecast(String day, String temp, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(day),
        Icon(icon),
        Text(temp),
      ],
    );
  }
}
