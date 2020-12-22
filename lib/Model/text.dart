import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.text,
    @required this.onPressed
});
  final GestureTapCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
  return ButtonTheme(minWidth: 250,
      child: RaisedButton(child: RichText(text: TextSpan(text:text, style: TextStyle(fontSize: 30))),
          onPressed: onPressed));
  }
}

class CustomText extends StatelessWidget {
    CustomText({
    @required this.text
});
    final String text;
    @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(text:text, style: TextStyle(fontSize: 40, color: Colors.black)));
  }
}