import 'package:flutter/material.dart';

void main() => runApp(MyCon());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constraints Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Constraints Example'),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300 ,
            ),
            child: Container(
              color: Colors.blue,
              width: 350,
              height: 200,
              child: const Text(
                'ConstrainedBox Example',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class MyCon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constraints Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Constraints Example'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 240,
                  maxHeight: 100
                ),
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Flexible Example',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 250,
                ),
                child: Container(
                  color: Colors.green,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Flexible Example',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 350,
                ),
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Flexible Example',
                      style: TextStyle(color: Colors.white),
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
