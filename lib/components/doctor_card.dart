import 'package:doctor_appointment/screens/doctor_details_screen.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {super.key,
      required this.route,
      required this.imageurl,
      required this.name,
      required this.dep,
      required this.college,
      required this.work,
      required this.rating,
      required this.experince,
      required this.about,
      required this.reviews});
  final String route;
  final String imageurl;
  final String name;
  final String about;
  final String dep;
  final String experince;
  final double rating;
  final int reviews;
  final String college;
  final String work;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: Config.screenWidth! * 0.33,
                child: Image.asset(
                  imageurl,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dep,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                     const  Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow.shade800,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Text('${rating}'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Reviews'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('$reviews'),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          //  Navigator.of(context).pushNamed(route);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DoctorDetails(
                name: name,
                Experience: experince,
                about: about,
                college:college ,
                imageUrl: imageurl,
                work: work,
              ),),);
        },
      ),
    );
  }
}
