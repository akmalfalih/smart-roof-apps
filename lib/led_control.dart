import 'package:flutter/material.dart';

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class LedControlPage extends StatefulWidget {
  const LedControlPage({super.key});

  @override
  State<LedControlPage> createState() => _LedControlPageState();
}

class _LedControlPageState extends State<LedControlPage> {
  dynamic _ledState;
  String _buttonState = 'waiting';
  String _ledDisplay = 'none';
  final _database = FirebaseDatabase.instance.ref(); // reference ke database
  late StreamSubscription _dailySpecialStream;

  @override // aktifin listener (perubahan data)
  void initState() {
    super.initState();
    _activateListener();
  }

  void _activateListener() {
    _dailySpecialStream = _database.child('live/led').onValue.listen((event) {
      // cek perubahan data
      _ledState = event.snapshot.value;
      final String roofString = _ledState;
      setState(() {
        _ledDisplay = roofString;
        if (_ledDisplay == 'OFF') {
          _buttonState = 'ON';
        } else if (_ledDisplay == 'ON') {
          _buttonState = 'OFF';
        } else {
          _buttonState = 'None';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lamp Control',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Card(
                color: Colors.blue,
                elevation: 5,
                shadowColor: Colors.black,
                child: SizedBox(
                  height: 250,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        _ledDisplay,
                        style: TextStyle(
                          fontSize: 30,
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
              ElevatedButton(
                onPressed: () async {
                  final ledControl = <String, dynamic>{
                    'led': _buttonState,
                  };
                  await _database
                      .child('live')
                      .update(ledControl)
                      .then((_) => print('Temperature has been written!'))
                      .catchError((e) => print('You got an error $e'));
                },
                child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Center(
                    child: Text(
                      _buttonState,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
