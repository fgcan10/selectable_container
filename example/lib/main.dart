import 'package:example2/selectable_container_grid.dart';
import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Selectable Container Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _select1 = false;
  bool _select2 = false;
  bool _select3 = false;

  @override
  Widget build(BuildContext context) {
    var textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Container Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SelectableContainer(
              onValueChanged: (newValue) {
                setState(() {
                  _select1 = newValue;
                });
              },
              selected: _select1,
              padding: 8.0,
              child: buildTextContentOfContainer(
                  'Selectable Container', 'Default theme colors', textStyles),
            ),
          ),
          const SizedBox(height: 16.0),
          SelectableContainer(
            selectedBorderColor: Colors.teal.shade700,
            selectedBackgroundColor: Colors.grey.shade100,
            unselectedBorderColor: Colors.teal.shade600,
            unselectedBackgroundColor: Colors.grey.shade200,
            iconAlignment: Alignment.topLeft,
            icon: Icons.thumb_up,
            unselectedIcon: Icons.add_box,
            iconSize: 24,
            unselectedOpacity: 1,
            selectedOpacity: 0.8,
            selected: _select2,
            padding: 8.0,
            child: buildTextContentOfContainer('Custom color',
                'Icon, size, position en opacitiy changed', textStyles),
            onValueChanged: (newValue) {
              setState(() {
                _select2 = newValue;
              });
            },
          ),
          const SizedBox(height: 16.0),
          SelectableContainer(
            iconSize: 20,
            icon: Icons.star,
            iconColor: Colors.yellowAccent,
            unselectedOpacity: 0.3,
            opacityAnimationDuration: 300,
            elevation: 4.0,
            selected: _select3,
            padding: 16.0,
            onValueChanged: (newValue) {
              setState(() {
                _select3 = newValue;
              });
            },
            child: buildDemoContent3(),
          ),
          const SizedBox(height: 16.0),
          const Expanded(child: SelectableContainerGrid()),
        ],
      ),
    );
  }

  Widget buildTextContentOfContainer(
      String title, String subtitle, TextTheme textStyles) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: textStyles.headline5,
        ),
        Text(
          subtitle,
          style: textStyles.bodyText1,
        ),
      ],
    );
  }

  Widget buildDemoContent3() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('images/flutter.png'),
              radius: 25.0,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'Develop with Flutter',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  color: Colors.blue.shade700),
            ),
          ],
        )
      ],
    );
  }
}
