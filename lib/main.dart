import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'temperature.dart';
import 'control.dart';
import 'about.dart';
import 'led_control.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      title: 'Smart Rooftop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconData> listIcons = [
    Icons.lightbulb,
    Icons.roofing,
    Icons.thermostat,
    Icons.info_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text(
          'Smart Roof',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              child: SizedBox(
                height: 350,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          return Text(
                            DateFormat('MM/dd/yyyy hh:mm:ss')
                                .format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Hi, Akmal!",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _cardMenu(
                        icon: listIcons[2],
                        title: 'Temperature',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // route ke page write_examples
                              builder: (context) => const TempPage(),
                            ),
                          );
                        },
                      ),
                      _cardMenu(
                        icon: listIcons[1],
                        title: 'Roof Control',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // route ke page write_examples
                              builder: (context) => const ControlPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _cardMenu(
                        icon: listIcons[0],
                        title: 'Lamp',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // route ke page write_examples
                              builder: (context) => const LedControlPage(),
                            ),
                          );
                        },
                      ),
                      _cardMenu(
                        icon: listIcons[3],
                        title: 'About',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              // route ke page write_examples
                              builder: (context) => const AboutPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardMenu({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
        ),
        width: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 35,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }
}
