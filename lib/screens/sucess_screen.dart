import 'package:doctor_appointment/components/button.dart';
import 'package:flutter/material.dart';


class AppointmentDone extends StatelessWidget {
  const AppointmentDone({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset('assets/done.gif'),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Successfully Booked',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Button(
                width: double.infinity,
                title: 'Back To Home Page',
                onPressed: () {
                  Navigator.of(context).pushNamed('main');
                },
                disable: false),
          )
        ],
      )),
    );
  }
}
