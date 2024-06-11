import 'package:flutter/material.dart';

class BoxScroll extends StatelessWidget {
  final double? width;
  final double height;
  final Widget child;
  final ScrollController? scrollController;
  final Color? backgroundColor;

  BoxScroll({
    required this.child,
    this.width,
    this.height = 200,
    this.scrollController,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController boxScrollController =
        scrollController ?? ScrollController();
    Color boxBackgroundColor =
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;
    return ConstrainedBox(
      constraints: width == null
          ? BoxConstraints(
              maxHeight: height,
            )
          : BoxConstraints(
              maxWidth: width!,
              maxHeight: height,
            ),
      child: SingleChildScrollView(
        controller: boxScrollController,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Container(
          color: boxBackgroundColor,
          child: child,
        ),
      ),
    );
  }
}
