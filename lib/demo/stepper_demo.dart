import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.black,
                  ),
                  child: Stepper(
                      currentStep: _currentStep,
                      onStepTapped: (int value) {
                        print(value);
                        setState(() {
                          _currentStep = value;
                        });
                      },
                      onStepContinue: () {
                        setState(() {
                          _currentStep < 2
                              ? _currentStep += 1
                              : _currentStep = 0;
                        });
                      },
                      onStepCancel: () {
                        setState(() {
                          _currentStep > 0
                              ? _currentStep -= 1
                              : _currentStep = 0;
                        });
                      },
                      steps: [
                        Step(
                            title: Text('title1'),
                            subtitle: Text('login first'),
                            content: Text('content1'),
                            isActive: _currentStep == 0),
                        Step(
                            title: Text('title2'),
                            subtitle: Text('title2 first'),
                            content: Text('content2'),
                            isActive: _currentStep == 1),
                        Step(
                            title: Text('title3'),
                            subtitle: Text('title3 first'),
                            content: Text('content3'),
                            isActive: _currentStep == 2)
                      ]))
            ],
          )),
    );
  }
}
