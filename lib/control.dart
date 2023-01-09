import 'package:flutter/material.dart';

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  dynamic _roofState;
  String _buttonState = 'waiting';
  String _roofDisplay = '';
  final _database = FirebaseDatabase.instance.ref(); // reference ke database
  late StreamSubscription _dailySpecialStream;

  @override // aktifin listener (perubahan data)
  void initState() {
    super.initState();
    _activateListener();
  }

  void _activateListener() {
    _dailySpecialStream =
        _database.child('live/posisi').onValue.listen((event) {
      // cek perubahan data
      _roofState = event.snapshot.value;
      final String roofString = _roofState.toString();
      setState(() {
        _roofDisplay = "Your roof is $roofString";
        if (_roofState == 'outside') {
          _buttonState = 'IN';
        } else if (_roofState == 'inside') {
          _buttonState = 'OUT';
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
          'Roof Control',
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
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        _roofDisplay,
                        style: const TextStyle(
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
                  final servoControl = <String, dynamic>{
                    'servo': _buttonState,
                  };
                  await _database
                      .child('live')
                      .update(servoControl)
                      .then((_) => print('Roof position has been written!'))
                      .catchError((e) => print('You got an error $e'));
                },
                child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Center(
                    child: Text(
                      _buttonState,
                      style: const TextStyle(
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
