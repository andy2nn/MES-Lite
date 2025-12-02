import 'package:flutter/material.dart';
import 'package:mes_lite/core/navigation/app_navigations.dart';
import 'package:mes_lite/core/widgets/buttons/gh_button.dart';
import 'package:mes_lite/core/widgets/buttons/gh_text_button.dart';
import 'package:mes_lite/core/widgets/containers/gh_container.dart';
import 'package:mes_lite/core/widgets/textfilds/gh_textfield.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 920),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column: sign-in form (narrow)
                Expanded(
                  flex: 0,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.account_circle_outlined,
                                size: 56,
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.9),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Sign in to MES Lite',
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          GHContainer(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('Username ',
                                    style: theme.textTheme.bodyLarge),
                                const SizedBox(height: 8),
                                GHTextfield(
                                    controller: TextEditingController()),
                                const SizedBox(height: 16),
                                Text('Password',
                                    style: theme.textTheme.bodyLarge),
                                const SizedBox(height: 8),
                                GHTextfield(
                                    controller: TextEditingController()),
                                const SizedBox(height: 18),
                                GHButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, AppNavigations.themeDemoPage),
                                  label: 'Sign in',
                                  variant: GHButtonVariant.green,
                                  fullWidth: true,
                                ),
                                const SizedBox(height: 18),
                              ],
                            ),
                          ),
                          GHContainer(
                            child: Column(
                              children: [
                                // admin provisioning info
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Accounts are provisioned by your organization administrator.',
                                        style: theme.textTheme.bodySmall,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 8),
                                      GHTextButton(
                                        text: 'Contact administrator',
                                        onPressed: () {
                                          showDialog<void>(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title:
                                                  const Text('Request access'),
                                              content: const Text(
                                                  'Accounts are created by your administrator. Please contact them to request access.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(ctx).pop(),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
