import 'package:doctor_appointment/components/button.dart';
import 'package:doctor_appointment/components/custom_App_bar.dart';
import 'package:doctor_appointment/models/data.dart';
import 'package:doctor_appointment/providers/tickets.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.name});
  final String name;

  @override
  State<BookingPage> createState() => _BookingPageState();
}
//enum FilterStatus { upcoming, complete, cancel }
class _BookingPageState extends State<BookingPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final myticketProvider = Provider.of<tickets>(context);
    return Scaffold(
      appBar: CustomAppbar(
        appTitle: 'Appointment',
        icon: FaIcon(
          Icons.arrow_back_ios,
        ),
      ),
      body: Consumer<tickets>(
        builder: (context, ticket, child) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    _tableCalendar(),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 25,
                      ),
                      child: Text(
                        'Select Consulation Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _isWeekend
                  ? SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 30,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Weekend is not available,please select another date',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              _timeSelected = true;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? Config.primaryColor
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _currentIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        );
                      }, childCount: 8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.5,
                      ),
                    ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                  child: Button(
                      width: double.infinity,
                      title: 'Make Appointment ',
                      onPressed: () {
                        myticketProvider.addOrder(
                          widget.name,
                          _currentDay.toString(),
                          "${_currentIndex! + 9}",
                          _currentDay.day != DateTime.now().day
                              ? FilterStatus.upcoming
                              : FilterStatus.complete,
                        );
                        Navigator.of(context).pushNamed('sucess_booking');
                      },
                      //booking button will be disabled if you dont pick date or time
                      disable: _timeSelected && _dateSelected ? false : true),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
