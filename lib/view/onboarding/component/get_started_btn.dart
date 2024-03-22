import 'package:flutter/material.dart';
import 'package:onboarding_ui/main.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          child: Text(
            'Get Started',
            style: $styles.text.labelLarge
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
