import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sneakers_app/pages/QuizPage/screens/QuizPage.dart';

class CongratsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 226, 239),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            _buildCongratsHeader(),
            SizedBox(height: 20),
            _buildCongratsContent(),
            SizedBox(height: 20),
            _buildPieChart(),
            SizedBox(height: 40),
            _buildPlayAgainButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCongratsHeader() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        // Child widget can be added here if needed
      ),
    );
  }

  Widget _buildCongratsContent() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromARGB(255, 110, 220, 85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Congrats! You Win',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'You earn 300 Coin',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Colors.green,
              value: 70,
              title: '70%',
              radius: 50,
              showTitle: true,
              titleStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            PieChartSectionData(
              color: Colors.red,
              value: 30,
              title: '30%',
              radius: 50,
              showTitle: true,
              titleStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayAgainButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizHomeScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 6, 69, 177),
        ),
        height: 40,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Center(
          child: Text(
            'Play Again',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
