
import 'package:doctor_appointment/providers/doctors.dart';
import 'package:doctor_appointment/providers/schedules.dart';
import 'package:doctor_appointment/providers/tickets.dart';
import 'package:doctor_appointment/screens/auth_screen.dart';
import 'package:doctor_appointment/screens/sucess_screen.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:doctor_appointment/utils/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => tickets(),
          ),
          ChangeNotifierProvider(
            create: (_) =>schedules(),
          ),
          ChangeNotifierProvider(
            create: (_) =>doctors(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // navigatorKey: navigatorKey,
      title: 'Flutter doctor app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Config.primaryColor,
            border: Config.outlinedBorder,
            focusedBorder: Config.focusBorder,
            errorBorder: Config.errorBorder,
            enabledBorder: Config.outlinedBorder,
            floatingLabelStyle: TextStyle(
              color: Config.primaryColor,
            ),
            prefixIconColor: Colors.black38),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Config.primaryColor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed
            ),
      ),
      initialRoute: '/',
      routes: {
        // Authorization Page
        '/': (context) => const AuthPAge(),
        // Main page
        'main': (context) => const MainLayout(),
        'sucess_booking': (context) => const AppointmentDone()
      },
    );
  }
}
