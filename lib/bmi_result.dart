import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMI_Result extends StatelessWidget {
  final double result;
  final bool gender;
  final int age;

  late String bmiIntegration;
  late String bmiStatus;
  late Color bColor;

  BMI_Result({required this.result, required this.age, required this.gender});

  @override
  Widget build(BuildContext context) {
    setBmiIntegration();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff453a94), Color(0xfff43b47)],
            ),
          ),
        ),
        title: Text(
          "BMI Score",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff453a94), Color(0xfff43b47)],
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gender : ${(gender ? 'Male' : 'Female')}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Age : $age",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Score : ${result.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Container(
                width: 300,
                height: 300,
                child: SfRadialGauge(
                  axes: [
                    RadialAxis(
                      minimum: 0,
                      maximum: 40,
                      interval: 5,
                      ranges: [
                        GaugeRange(
                          startValue: 0,
                          endValue: 18.4,
                          color: Colors.red,
                        ),
                        GaugeRange(
                          startValue: 18.5,
                          endValue: 24.9,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          startValue: 25.0,
                          endValue: 29.9,
                          color: Colors.orange,
                        ),
                        GaugeRange(
                          startValue: 30,
                          endValue: 40,
                          color: Colors.pink,
                        )
                      ],
                      pointers: [
                        NeedlePointer(
                          value: result,
                          enableAnimation: true,
                        )
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Text(
                            result.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          positionFactor: 0.5,
                          angle: 90,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                bmiStatus,
                style: TextStyle(
                    fontSize: 30, color: bColor, fontWeight: FontWeight.bold),
              ),
              Text(
                bmiIntegration,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  void setBmiIntegration() {
    if (result > 30) {
      bmiStatus = "Obese";
      bmiIntegration = "Please work to reduce obesity";
      bColor = Colors.pink;
    } else if (result >= 25) {
      bmiStatus = "Overweight";
      bmiIntegration = "Do regular exercise and reduce the weight";
      bColor = Colors.orange;
    } else if (result >= 18.5) {
      bmiStatus = "Normal";
      bmiIntegration = "Enjoy you are fit";
      bColor = Colors.green;
    } else if (result < 18.5) {
      bmiStatus = "Underweight";
      bmiIntegration = "Try to increase the weight";
      bColor = Colors.red;
    }
  }
}
