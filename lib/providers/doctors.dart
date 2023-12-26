import 'package:doctor_appointment/models/data.dart';
import 'package:flutter/material.dart';

class doctors with ChangeNotifier {
  List<Doctor> _doctorsData = [
    Doctor(
        name: 'Kenzy Mohamed',
        dep: 'dental',
        college: 'Faculty of dentistry Alexandria university',
        imageUrl: 'assets/kanoza.jpg',
        work: "shark el madina hospital",
        about:
            "Dr kenzy mohamed is an experience dentist at shark el madina hospital,he is graduated from faculty of dentistry Alexandria university",
        Patient: {
          "ahmed": 4,
          "mohamed": 5,
          "ali": 5,
          "ibrahem": 4,
          "sayed": 3,
          "khalil": 5
        },
        Experience: "10 years",
        rating: 4.5),
    Doctor(
        name: 'Aya Mohamed',
        dep: 'cardiology',
        college: 'Faculty of Medicine Alexandria university',
        imageUrl: 'assets/osho.jpeg',
        work: "el madina hospital",
        about:
            "Dr aya mohamed is an experience cardiologist at el madina hospital,he is graduated from faculty of medicine Alexandria university",
        Patient: {
          "ahmed": 4,
          "mohamed": 3,
          "ali": 2,
          "ibrahem": 1,
          "sayed": 5,
          "khalil": 4
        },
        Experience: "10 years",
        rating: 3.5),
    Doctor(
        name: 'ahmed fathallah',
        dep: 'dental',
        college: 'Faculty of Medicine Alexandria university',
        imageUrl: 'assets/fathy.jpeg',
        work: "shark el madina hospital",
        about:
            "Dr ahmed fathallah is an experience Repiratory doctor at sedi beshr hospital,he is graduated from faculty of medicine Alexandria university",
        Patient: {
          "ahmed": 2,
          "mohamed": 4,
          "ali": 4,
          "ibrahem": 4,
          "sayed": 3,
          "khalil": 3
        },
        Experience: "10 years",
        rating: 2.5),
    Doctor(
        name: 'samera ahmed ',
        dep: 'dental',
        college: 'Faculty of Medicine Alexandria university',
        imageUrl: 'assets/doctor_4.jpg',
        work: "standard hospital",
        about:
            "Dr samera is an experience dentist at shark el madina hospital,she is graduated from faculty of dentistry Alexandria university",
        Patient: {
          "ahmed": 5,
          "mohamed": 5,
          "ali": 5,
          "ibrahem": 4,
          "sayed": 4,
          "khalil": 5
        },
        Experience: "7 years",
        rating: 4.8),
    Doctor(
        name: 'Salma Ahmed',
        dep: 'dental',
        college: 'Faculty of Medicine Alexandria university',
        imageUrl: 'assets/doctor_5.jpg',
        work: "shark el madina hospital",
        about:
            "Dr salma ahmed is an experience dentist at shark el madina hospital,she is graduated from faculty of dentistry Alexandria university",
        Patient: {
          "ahmed": 4,
          "mohamed": 5,
          "ali": 5,
          "ibrahem": 4,
          "sayed": 3,
          "khalil": 5
        },
        Experience: "3 years",
        rating: 4.5),
    Doctor(
        name: 'mirna ali',
        dep: 'cardiology',
        college: 'Faculty of Medicine Alexandria university',
        imageUrl: 'assets/doctor_6.jpg',
        work: "shark el madina hospital",
        about:
            "Dr mirna ali is an experience dentist at shark el madina hospital,she is graduated from faculty of medicine Alexandria university",
        Patient: {
          "ahmed": 4,
          "mohamed": 5,
          "ali": 5,
          "ibrahem": 4,
          "sayed": 3,
          "khalil": 5
        },
        Experience: "5 years",
        rating: 4.5),
    Doctor(
        name: 'yeyha osama ',
        dep: 'gynecology',
        college: 'Faculty of Medicine Alexandria university',
        imageUrl: 'assets/doctor_8.jpg',
        work: "shark el madina hospital",
        about:
            "Dr yehya osama is an experience gynecologist at shark el madina hospital,he is graduated from faculty of medicine Alexandria university",
        Patient: {
          "ahmed": 4,
          "mohamed": 5,
          "ali": 5,
          "ibrahem": 4,
          "sayed": 3,
          "khalil": 5
        },
        Experience: "2 years",
        rating: 4.5),
  ];

  List<Doctor> get doctorsD {
    return [..._doctorsData];
  }

  double getMaxRating() {
    double maxRating = 0.0;

    for (Doctor doctor in _doctorsData) {
      if (doctor.rating > maxRating) {
        maxRating = doctor.rating;
      }
    }

    return maxRating;
  }

  double getMinRating() {
    double minRating = double.infinity;

    for (Doctor doctor in _doctorsData) {
      if (doctor.rating < minRating) {
        minRating = doctor.rating;
      }
    }

    return minRating;
  }

  double getAverageRating() {
    double totalRating = 0.0;
    int count = 0;

    for (Doctor doctor in _doctorsData) {
      totalRating += doctor.rating;
      count++;
    }

    if (count > 0) {
      return double.parse((totalRating / count).toStringAsFixed(3),);
    } else {
      return 0.0;
    }
  }
}
