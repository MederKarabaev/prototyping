import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prototyping/core/constants/app_text_constants.dart';
import 'package:prototyping/routes/mobile_auto_router.dart';
import 'package:prototyping/server/service_locator.dart';
import 'package:prototyping/theme/app_theme.dart';
import 'package:prototyping/widgets/init_widget.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = sl<AppRouter>();

void main() async {
  await initServiceLocator();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(
        builder: (context) => MaterialApp.router(
          scaffoldMessengerKey: scaffoldKey,
          theme: lightTheme,
          title: AppTextConstants.appTitle,
          debugShowCheckedModeBanner: false,

          ///Auto router settings
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(appRouter),
          routeInformationProvider: appRouter.routeInfoProvider(),

          ///Localizations settings
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
        ),
      ),
    );
  }
}
