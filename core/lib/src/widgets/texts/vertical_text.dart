import 'package:flutter/material.dart';

class VerticalText extends StatefulWidget {
  final String text;
  const VerticalText({
    Key? key,
    this.text = "Giriş Yap",
  }) : super(key: key);

  @override
  _VerticalTextState createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
