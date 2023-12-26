import 'package:doctor_appointment/components/appointment_card.dart';
import 'package:doctor_appointment/components/doctor_card.dart';
import 'package:doctor_appointment/models/data.dart';
import 'package:doctor_appointment/providers/doctors.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> categories = [
    {
      'icon': FontAwesomeIcons.userDoctor,
      'category': "General",
    },
    {
      'icon': FontAwesomeIcons.heartPulse,
      'category': "Cardiology",
    },
    {
      'icon': FontAwesomeIcons.lungs,
      'category': "Respiration",
    },
    {
      'icon': FontAwesomeIcons.hand,
      'category': "Dermatology",
    },
    {
      'icon': FontAwesomeIcons.personPregnant,
      'category': "Gynecology",
    },
    {
      'icon': FontAwesomeIcons.teeth,
      'category': "Dental",
    }
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final myDoctorProvider = Provider.of<doctors>(context);
    return Scaffold(
      body: Consumer<doctors>(builder: (context, doc, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  <Widget>[
                    Text(
                      'kenzy',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/kanoza.jpg'),
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                    height: Config.screenHeight! * 0.06,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(right: 20),
                          color: Config.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FaIcon(
                                  categories[index]['icon'],
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  categories[index]['category'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                    )),
                Config.spaceSmall,
                Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                AppointmentCard(),
                Config.spaceSmall,
                Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox( //to avoid parent error
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                      itemBuilder: (contex, index) {
                        return DoctorCard(
                          route: 'doc_details',
                          dep: myDoctorProvider.doctorsD[index].dep,
                       imageurl: myDoctorProvider.doctorsD[index].imageUrl,
                          college: myDoctorProvider.doctorsD[index].college,
                          work: myDoctorProvider.doctorsD[index].work,
                          name: myDoctorProvider.doctorsD[index].name,
                          about: myDoctorProvider.doctorsD[index].about,
                          rating: myDoctorProvider.doctorsD[index].rating,
                          experince: myDoctorProvider.doctorsD[index].Experience,
                          reviews: myDoctorProvider.doctorsD[index].Patient.length,
                        );
                      },
                      itemCount: myDoctorProvider.doctorsD.length),
                ),
              ],
            ),
          )),
        );
      },
      ),
    );
  }
}
