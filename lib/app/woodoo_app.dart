import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/localizations/locale_provider.dart';
import '../core/localizations/l10n_provider.dart';
import '../features/home/pages/my_home_page.dart';

class WoodooApp extends ConsumerWidget {
  const WoodooApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      builder: (context, child) {
        final l10n = AppLocalizations.of(context)!;
        return ProviderScope(
          overrides: [
            l10nProvider.overrideWithValue(l10n),
          ],
          child: child!,
        );
      },

      home: const MyHomePage(),
    );
  }
}
