import 'package:doctor_appointment/components/button.dart';
import 'package:doctor_appointment/components/custom_App_bar.dart';
import 'package:doctor_appointment/screens/booking_page.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails(
      {super.key,
      required this.name,
      required this.college,
      required this.work,
      required this.Experience,
      required this.imageUrl,
      required this.about});
  final String name;
  final String college;
  final String work;
  final String Experience;
  final String about;
  final String imageUrl;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Doctor Details',
        icon: FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
            ),
            color: Colors.red,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height *0.42,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(widget.imageUrl),
                    backgroundColor: Colors.white,
                  ),
                  Config.spaceMedium,
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Config.spaceSmall,
                  SizedBox(
                    width: Config.screenWidth! * 0.75,
                    child: Text(
                      widget.college,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Config.spaceSmall,
                  SizedBox(
                    width: Config.screenWidth! * 0.75,
                    child: Text(
                      widget.work,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height *0.33,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Config.spaceSmall,
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Config.primaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                      //  vertical: 30,
                       // horizontal: 10,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Experience",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.Experience,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Config.spaceSmall,
                  const Text(
                    'About Doctor',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Config.spaceSmall,
                  Text(
                    widget.about,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: 'Book Appointment ',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookingPage(
                        name: widget.name,
                      ),
                    ),
                  );
                },
                disable: false,
              ),
            )
          ],
        ),
      )),
    );
  }
}
