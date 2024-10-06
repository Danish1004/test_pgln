import "package:flutter/material.dart";

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? title;
  EdgeInsets? padding;
  EdgeInsetsGeometry? margin;
  Color? color;
  final int? titleheight;

  AppCard({
    super.key,
    required this.child,
    this.title,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.titleheight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            margin: margin,
            color: color ?? Colors.white,
            child: Container(
              alignment: Alignment.topLeft,
              padding: padding ?? const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
