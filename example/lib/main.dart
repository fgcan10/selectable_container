import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable Container Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Container Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectableContainer(
            child: buildTextContentOfContainer(
                'Selectable Container', 'Default theme colors', textStyles),
            onPressed: () {},
            padding: 8.0,
          ),
          SizedBox(
            height: 16.0,
          ),
          SelectableContainer(
            selectedBorderColor: Colors.teal.shade700,
            selectedBackgroundColor: Colors.grey.shade100,
            unselectedBorderColor: Colors.teal.shade600,
            unselectedBackgroundColor: Colors.grey.shade200,
            iconAlignment: Alignment.topLeft,
            icon: Icons.thumb_up,
            iconSize: 24,
            unselectedOpacity: 0.5,
            padding: 8.0,
            child: buildTextContentOfContainer('Custom color',
                'Icon, size, position en opacitiy changed', textStyles),
            onPressed: () {},
          ),
          SizedBox(
            height: 16.0,
          ),
          SelectableContainer(
            iconSize: 20,
            icon: Icons.star,
            iconColor: Colors.yellowAccent,
            unselectedOpacity: 0.3,
            opacityAnimationDuration: 300,
            elevation: 4.0,
            child: buildDemoContent3(),
            padding: 16.0,
            onPressed: () {},
          )
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
          style: textStyles.display1,
        ),
        Text(
          subtitle,
          style: textStyles.body1,
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
            CircleAvatar(
              backgroundImage: AssetImage('images/flutter.png'),
              radius: 25.0,
            ),
            SizedBox(
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
