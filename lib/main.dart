import 'package:base_tutorial/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: Hive.openBox('PersonModel'),
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        PersonModel person = PersonModel(
                          name: "Israel Oluwapelumi",
                          email: "israeloluwapelumi@gmail.com",
                          password: "12345678",
                        );

                        Hive.box('PersonModel').put(1, person);
                      },
                      child: const Text("ADD"),
                    ),
                    MaterialButton(
                      onPressed: () {
                       final result = Hive.box('PersonModel').get(1);
                       if (kDebugMode) {
                         print(result);
                       }
                      },
                      child: const Text("UPDATE"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Hive.box('PersonModel').delete(1);
                      },
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
