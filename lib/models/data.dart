class Doctor {
  final String name;
  final String dep;
  final String college;
  final String imageUrl;
  final String work;
  final String about;
  final Map<String, double> Patient;
  final String Experience;
  final double rating;

  Doctor(
      {required this.name,
      required this.dep,
      required this.college,
      required this.imageUrl,
      required this.work,
      required this.about,
      required this.Patient,
      required this.Experience,
      required this.rating});
}

class Appointment {
  final String date;
  final String time;
  final String doctor;

  Appointment({
    required this.date,
    required this.time,
    required this.doctor,
  });
}
enum FilterStatus { upcoming, complete, cancel }
class ticket{
  final String doc_name;
  final String Date;
  final String time;
  final FilterStatus type;
  ticket({
    required this.doc_name,
    required this.Date,
    required this.time,
    required this.type
  });
}
