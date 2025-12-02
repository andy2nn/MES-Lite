// кнопка в стиле гитхаба
import 'package:flutter/material.dart';

enum GHButtonVariant { green, gray }

class GHButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final GHButtonVariant variant;
  final Widget? icon;
  final bool fullWidth;

  const GHButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.variant = GHButtonVariant.green,
    this.icon,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isGreen = variant == GHButtonVariant.green;
    final isLight = theme.brightness == Brightness.light;

    final Color backgroundColor = isGreen
        ? theme.colorScheme.secondary
        : (isLight ? const Color(0xFFF6F8FA) : const Color(0xFF2D333B));

    final Color foregroundColor = isGreen
        ? theme.colorScheme.onSecondary
        : (isLight ? const Color(0xFF24292F) : Colors.white);

    final Color borderColor = !isGreen
        ? (isLight ? const Color(0xFFD0D7DE) : const Color(0xFF30363D))
        : Colors.transparent;

    final buttonChild = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon!,
              const SizedBox(width: 8),
              Text(label),
            ],
          )
        : Text(label);

    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: const Size.fromHeight(44),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: borderColor, width: 1),
        ),
        textStyle:
            theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: buttonChild,
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
