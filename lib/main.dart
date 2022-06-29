import 'package:untitled/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakBadApp(appRouter: AppRouter()));
}

class BreakBadApp extends StatelessWidget {
  final AppRouter appRouter;
  const BreakBadApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
