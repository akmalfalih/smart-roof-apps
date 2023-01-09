import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 25,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              child: SizedBox(
                height: 100,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Fachmet Dwi P",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              child: SizedBox(
                height: 100,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Harry Freddy H",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              child: SizedBox(
                height: 100,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Muhammad Akmal Falih Rizqullah",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              child: SizedBox(
                height: 100,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Muhammad Saddam W",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              child: SizedBox(
                height: 100,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Try Mulyadi",
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
    );
  }
}
