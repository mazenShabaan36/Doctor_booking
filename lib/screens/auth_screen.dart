import 'package:doctor_appointment/components/login_form.dart';
import 'package:doctor_appointment/components/signUp_form.dart';
import 'package:doctor_appointment/components/social_button.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:doctor_appointment/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPAge extends StatefulWidget {
  const AuthPAge({super.key});

  @override
  State<AuthPAge> createState() => _AuthPAgeState();
}

class _AuthPAgeState extends State<AuthPAge> {
  bool isSignin = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 35,
        ),
        child: SingleChildScrollView(
          child: SizedBox( // to avoid parent error 
            height: Config.screenHeight!*0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.enText['welcome_text']!,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/doctor_logo.png',
                      fit: BoxFit.contain,
                      height: Config.screenHeight! * 0.06,
                    ),
                  ],
                ),
                Config.spaceSmall,
                Text(
                  isSignin
                      ? AppText.enText['signIn_text']!
                      : AppText.enText['signUp_text']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                isSignin ? const LoginForm() : const SignUpForm(),
                Config.spaceSmall,
                isSignin
                    ? Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppText.enText['forgot-password']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )),
                      )
                    : Container(),
              Config.spaceMedium,
                Center(
                  child: Text(
                    AppText.enText['social-login']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                Config.spaceSmall,
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    SocialButton(social: 'google'),
                    SocialButton(social: 'facebook'),
                  ],
                ),
                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      isSignin
                          ? AppText.enText['signUp_text']!
                          : AppText.enText['registered_text']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignin = !isSignin;
                        });
                      },
                      child: Text(
                        isSignin ? 'Sign Up' : 'Sign In',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
