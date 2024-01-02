import 'package:flutter/material.dart';
import 'home.dart';
import 'themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(const MoviesProject());

class MoviesProject extends StatelessWidget {
  const MoviesProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: double.infinity, name: TABLET),
          // ResponsiveBreakpoint.autoScale(650, name: TABLET, scaleFactor: 1.25),
          // ResponsiveBreakpoint.autoScale(800, name: TABLET, scaleFactor: 1.4),
          // ResponsiveBreakpoint.autoScale(1000, name: TABLET, scaleFactor: 1.8),
        ],
        child: BouncingScrollWrapper.builder(context, child!),
      ),
      title: 'Movie Shop And Rental',
      theme: defaultTheme,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
