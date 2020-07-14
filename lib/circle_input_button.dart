import 'package:flutter/material.dart';

class CircleInputButtonConfig {
  // final double fontSize;
  /// default `MediaQuery.of(context).size.width * 0.095`
  final TextStyle textStyle;
  final Color backgroundColor;
  final double backgroundOpacity;
  final ShapeBorder shape;

  const CircleInputButtonConfig({
    this.textStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 36,
      color: Color(0xff383A51)
    ),
    this.backgroundColor = Colors.white,
    this.backgroundOpacity = 0.4,
    this.shape,
  });
}

class CircleInputButton extends StatelessWidget {
  final CircleInputButtonConfig config;

  final String text;
  final Sink<String> enteredSink;

  CircleInputButton({
    @required this.text,
    @required this.enteredSink,
    this.config = const CircleInputButtonConfig(),
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = config.textStyle ??
        TextStyle(
          fontFamily: 'Roboto',
//          fontSize: MediaQuery.of(context).size.width * 0.095,
          fontSize: 36,
          fontWeight: FontWeight.w400,
        );

    return RaisedButton(
      child: Text(
        text,
        style: textStyle,
      ),
      onPressed: () {
        enteredSink.add(text);
      },
      shape: config.shape ??
          CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
      color: config.backgroundColor.withOpacity(config.backgroundOpacity),
      elevation: 0,
    );
  }
}
