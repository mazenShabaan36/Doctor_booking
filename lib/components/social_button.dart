import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.social}) : super(key: key);
  final String social;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          side: const BorderSide(width: 1, color: Colors.black)),
      child: SizedBox(
        height: Config.screenHeight! * 0.085,
        width: Config.screenWidth! *0.34,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Image.asset(
                'assets/${social}.png',
                fit: BoxFit.contain,
                height: Config.screenHeight! * 0.04,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
