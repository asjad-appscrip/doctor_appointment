import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  try {
    await initServices();
    runApp(
      const MyApp(),
    );
  } catch (exception, st) {
    debugPrintStack(stackTrace: st);
  }
}

/// App Init Service For The APP
Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    minTextAdapt: true,
    useInheritedMediaQuery: true,
    designSize: const Size(375, 745),
    builder: (context, child) => GetMaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      builder: (context, child) => ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: child ?? Container(),
      ),
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      themeMode: ThemeMode.light,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      translations: TranslationsFile(),
    ),
  );
}
