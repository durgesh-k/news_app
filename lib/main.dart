import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/providers/news_providers.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/splashscreen.dart';
import 'package:news_app/utils/functions.dart';
import 'package:news_app/widgets/error.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
        ChangeNotifierProvider(create: (context) => HealthNewsProvider()),
        ChangeNotifierProvider(create: (context) => SportsNewsProvider()),
        ChangeNotifierProvider(create: (context) => BusinessNewsProvider()),
        ChangeNotifierProvider(create: (context) => SearchNewsProvider()),
      ],
      child: MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return ErrorScreen(errorDetails: errorDetails);
            };

            return ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, child!),
                maxWidth: getWidth(context),
                minWidth: 300,
                defaultScale: true,
                mediaQueryData:
                    MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
                breakpoints: [
                  const ResponsiveBreakpoint.resize(300, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
                background: Container(color: const Color(0xFFF5F5F5)));
          },
          home: SplashScreen()),
    );
  }
}
