// текстовое поле в стиле GitHub
import 'package:flutter/material.dart';

class GHTextfield extends StatelessWidget {
  final TextEditingController? controller;
  const GHTextfield({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 44,
      child: TextField(
        controller: controller,
        style: theme.textTheme.bodyLarge,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: theme.brightness == Brightness.light
                  ? const Color(0xFFD0D7DE)
                  : const Color(0xFF30363D),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2.0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
