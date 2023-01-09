import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  dynamic temperature;
  String tempDisp = '- C';
  final _database = FirebaseDatabase.instance.ref(); // reference ke database
  late StreamSubscription _dailySpecialStream;

  @override // aktifin listener (perubahan data)
  void initState() {
    super.initState();
    _activateListener();
  }

  void _activateListener() {
    _dailySpecialStream =
        _database.child('live/temperature').onValue.listen((event) {
      // cek perubahan data
      temperature = event.snapshot.value;
      final String tempString = temperature.toString();
      setState(() {
        tempDisp = '$tempString C';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text(
          'Temperature',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(Icons.save),
        ),
        onPressed: () async {
          final tempHistory = <String, dynamic>{
            'suhu': temperature,
            'waktu': DateTime.now().toString()
          };
          await _database
              .child('tempHistory')
              .push()
              .set(tempHistory)
              .then((_) => print('Temperature has been written!'))
              .catchError((e) => print('You got an error $e'));
        },
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
                height: 250,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      tempDisp,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'History',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 25,
            ),
            StreamBuilder(
              stream: _database
                  .child('tempHistory')
                  .orderByKey()
                  .limitToLast(10)
                  .onValue,
              builder: (context, snapshot) {
                final tileList = <ListTile>[];
                tileList.add(const ListTile(
                  leading: Text(
                    'Time Stamp                             ',
                  ),
                  title: Text(
                    'Suhu',
                  ),
                ));
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    (snapshot.data!).snapshot.value != null) {
                  final history = Map<dynamic, dynamic>.from(
                      (snapshot.data!).snapshot.value as Map<dynamic, dynamic>);
                  history.forEach((key, value) {
                    final tempHistory = Map<String, dynamic>.from(value);
                    final historyTile = ListTile(
                      leading: Text(tempHistory['waktu']),
                      title: Text(tempHistory['suhu'].toString()),
                    );
                    tileList.add(historyTile);
                  });
                }
                return Expanded(
                  child: ListView(
                    children: tileList,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _dailySpecialStream.cancel();
    super.deactivate();
  }
}
