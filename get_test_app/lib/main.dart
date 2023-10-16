import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_test_app/models/contact_model.dart';
import 'localizations/add_translation.dart';
import 'screens/contact_list_screen.dart';
import 'screens/counter_screen.dart';
import 'screens/first_screen.dart';
import 'screens/home_screen.dart';
import 'utils/my_bindings.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      locale: Locale('en'),
      translations: AddTranslation(),
      initialBinding: MyBindings(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/contact',
          page: () => ContactListScreen(),
        ),
        GetPage(
          name: '/firstpage',
          page: () => FirstScreen(),
        ),
        GetPage(
            name: '/counterpage',
            page: () => CounterScreen(),
            transition: Transition.downToUp),
      ],
      initialRoute: '/',
      // home: HomeScreen(),
    );
  }
}
