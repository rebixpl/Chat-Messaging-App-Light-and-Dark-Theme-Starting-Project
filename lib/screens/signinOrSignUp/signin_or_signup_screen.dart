import 'package:chat/components/primary_button.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';

class SigninOrSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 146.0,
              ),
              Spacer(flex: 1),
              PrimaryButton(
                text: "Sign In",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              PrimaryButton(
                text: "Sign Up",
                color: Theme.of(context).colorScheme.secondary,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatsScreen(),
                    ),
                  );
                },
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
