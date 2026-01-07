import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woodoo/core/localizations/localizations_extension.dart';

import '../../../app/app_config.dart';
import '../../../core/localizations/locale_provider.dart';
import '../../../shared/components/language_toggle.dart';



class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    final isHindi = locale?.languageCode == 'hi';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.instance.appName),
        actions: [
          LanguageToggle(
            isHindi: isHindi,
            onChanged: (value) {
              ref.read(localeProvider.notifier).state =
              value ? const Locale('hi') : const Locale('en');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.appStrings.welcomeUser('Abhijeet'),
            ),
            Text(context.appStrings.appTitle),
            Text(context.appStrings.login),
          ],
        ),
      ),
    );
  }
}
