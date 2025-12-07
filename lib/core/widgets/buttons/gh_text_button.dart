import 'package:flutter/material.dart';

class GHTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool fullWidth;

  const GHTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color textColor = theme.colorScheme.primary;

    final Color hoverColor = textColor.withAlpha(26); // примерно 10% opacity

    final button = TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        minimumSize: const Size.fromHeight(44),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        textStyle: theme.textTheme.bodyLarge
            ?.copyWith(fontWeight: FontWeight.w600, color: textColor),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return hoverColor;
            }
            if (states.contains(WidgetState.hovered)) {
              return hoverColor;
            }
            return null;
          },
        ),
      ),
      child: Text(text),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
