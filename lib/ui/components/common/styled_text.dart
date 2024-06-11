import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final Color? color;
  late final TextStyle? Function(BuildContext context)? getStyle;

  StyledText.displayLarge(this.text, {this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.displayLarge?.copyWith(
            color: color ?? Theme.of(context).textTheme.displayLarge?.color,
          );
    };
  }

  StyledText.headlineLarge(this.text, {this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: color ?? Theme.of(context).textTheme.headlineLarge?.color,
          );
    };
  }

  StyledText.titleLarge(this.text, {this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.titleLarge?.copyWith(
            color: color ?? Theme.of(context).textTheme.titleLarge?.color,
          );
    };
  }

  StyledText.labelLarge(this.text, {this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.labelLarge?.copyWith(
            color: color ?? Theme.of(context).textTheme.labelLarge?.color,
          );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getStyle?.call(context));
  }
}
