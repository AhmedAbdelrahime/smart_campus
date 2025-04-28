import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Year'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YearButton(
              year: '1st Year',
              onPressed: () {
                // Navigate or perform action for 1st year
                print('1st Year selected');
              },
            ),
            SizedBox(height: 20),
            YearButton(
              year: '2nd Year',
              onPressed: () {
                // Navigate or perform action for 2nd year
                print('2nd Year selected');
              },
            ),
            SizedBox(height: 20),
            YearButton(
              year: '3rd Year',
              onPressed: () {
                // Navigate or perform action for 3rd year
                print('3rd Year selected');
              },
            ),
            SizedBox(height: 20),
            YearButton(
              year: '4th Year',
              onPressed: () {
                // Navigate or perform action for 4th year
                print('4th Year selected');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YearButton extends StatelessWidget {
  final String year;
  final VoidCallback onPressed;

  const YearButton({required this.year, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        year,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
