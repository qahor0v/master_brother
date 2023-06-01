 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/config/router/app_router.dart';
import 'package:master_brother/src/ui/pages/auth_pages/start_page.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monitoring App Demo',
      theme: ThemeData(
        primarySwatch: primarySw,
        scaffoldBackgroundColor: bgColor,
      ),
      home: const StartPage(),
      routes: AppRouter.router(context),
    );
  }
}
