import 'package:flutter/material.dart';

class ButtonsView extends StatelessWidget {
  final String buttonText;
  final Function buttonTapped;

  const ButtonsView({
    super.key,
    required this.buttonText,
    required this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonTapped();
      },
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        color: Theme.of(context).colorScheme.onBackground,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ), // Optional: Set border radius
    );
  }
}
