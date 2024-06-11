import 'package:flutter/material.dart';

class StyledCard extends StatelessWidget {
  final TextStyle? textStyle;
  final Color? color;
  StyledCard({
    super.key,
    required this.name,
    this.textStyle,
    this.color,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = textStyle ??
        theme.textTheme.displayLarge!.copyWith(
          color: theme.colorScheme.onPrimary,
        );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(0.0, -0.5), end: Offset(0.0, 0.0))
                  .animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: Card(
        elevation: 10,
        color: color ?? theme.colorScheme.primary,
        key: ValueKey<String>(name),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            name,
            style: style,
          ),
        ),
      ),
    );
  }
}
