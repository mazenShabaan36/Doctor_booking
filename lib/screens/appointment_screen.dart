import 'package:doctor_appointment/components/appointment_card.dart';
import 'package:doctor_appointment/providers/schedules.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<schedules>(context);
    return Consumer<schedules>(
      builder: (context, schedule, child) {
        /*  List<dynamic> filteredSchedules =
            scheduleProvider.schedul.where((schedule) {
          return schedule['status'] == status;
        }).toList();
        */
        List<dynamic> filteredSchedules = [];
        for (var i = 0; i < scheduleProvider.schedul.length; i++) {
          if (scheduleProvider.schedul[i]['status'].toString().toLowerCase() == status.toString().toLowerCase()) {
            filteredSchedules.add(scheduleProvider.schedul[i]);
          }
        }
        print(scheduleProvider.schedul[0]['status']);
        print(scheduleProvider.schedul);
        print(filteredSchedules);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Appointment Schedule',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //this is the filtr tabs
                          for (FilterStatus filterStatus in FilterStatus.values)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (filterStatus == FilterStatus.upcoming) {
                                      status = FilterStatus.upcoming;
                                      _alignment = Alignment.centerLeft;
                                    } else if (filterStatus ==
                                        FilterStatus.complete) {
                                      status = FilterStatus.complete;
                                      _alignment = Alignment.center;
                                    } else if (filterStatus ==
                                        FilterStatus.cancel) {
                                      status = FilterStatus.cancel;
                                      _alignment = Alignment.centerRight;
                                    }
                                  });
                                },
                                child: Center(
                                  child: Text(filterStatus.name),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    AnimatedAlign(
                      alignment: _alignment,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Config.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            status.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Config.spaceSmall,
                Expanded(
                    child: ListView.builder(
                  itemBuilder: ((context, index) {
                    var schedule = filteredSchedules[index];
                    print(schedule);
                    bool isLastElement =
                        (filteredSchedules.length + 1 == index);
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: !isLastElement
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(schedule['doctor_profile']),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      schedule['doctor_name'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      schedule['category'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ScheduleCard(),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        schedule['status'] =
                                            FilterStatus.cancel;
                                      });
                                    },
                                    child: Text(
                                      'Cancel',
                                      style:
                                          TextStyle(color: Config.primaryColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Config.primaryColor),
                                    onPressed: () {
                                      //go to screen for take a new date and insert it in provider of schedules
                                    },
                                    child: Text(
                                      'Reschedule',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  itemCount: filteredSchedules.length,
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
