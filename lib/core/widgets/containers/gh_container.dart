import 'package:flutter/material.dart';

class GHContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  const GHContainer({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    final Color borderColor =
        isLight ? const Color(0xFFD0D7DE) : const Color(0xFF30363D);

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
