import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

class SimpleExamplePage extends StatefulWidget {
  @override
  _SimpleExamplePageState createState() => _SimpleExamplePageState();
}

class _SimpleExamplePageState extends State<SimpleExamplePage> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Container'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Default container',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SelectableContainer(
            selected: _selected,
            onValueChanged: (newValue) {
              setState(() {
                _selected = newValue;
              });
            },
            child: Text('Tap me'),
            padding: 16.0,
          ),
        ],
      ),
    );
  }
}
