import 'package:flutter/material.dart';

enum FilterStatus { upcoming, complete, cancel }

class schedules with ChangeNotifier {
  List<dynamic> _schedules = [
    {
      "doctor_name": "Mohamed ahmed",
      "doctor_profile": "assets/doctor_1.jpg",
      "category": "Dental",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Mazen shabaan",
      "doctor_profile": "assets/doctor_2.jpg",
      "category": "Cardiology",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Mahmoud ali",
      "doctor_profile": "assets/doctor_3.jpg",
      "category": "Respiration",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "ahmed omar",
      "doctor_profile": "assets/doctor_4.jpg",
      "category": "Dental",
      "status": FilterStatus.cancel,
    }
  ];

  List get schedul {
    return [..._schedules];
  }

  void addschedule(
      String name, String imageUrl, String depart, FilterStatus status) {
    _schedules.add({
      "doctor_name": name,
      "doctor_profile": imageUrl,
      "category": depart,
      "status": status
    });
     notifyListeners();
  }
}
