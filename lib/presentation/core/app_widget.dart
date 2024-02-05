import 'package:book_ai/constants.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:book_ai/presentation/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});
  final _appRouter = AppRouter();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(AppConstants.appWidth, AppConstants.appHeight));
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Book AI',
      theme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      //home: const TestingScreen()
    );
  }
}