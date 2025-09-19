import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String text;
  const RichTextWidget({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith( fontWeight: FontWeight.bold, fontSize: 17.0 ),
        children: [
          TextSpan(
            text: ": "
          ),
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith( fontWeight: FontWeight.normal, fontSize: 17.0 ),
          )
        ]
      )
    );
  }
}