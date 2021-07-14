import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

final List<Color> kGridElements = [
  Colors.amber[800]!,
  Colors.deepOrange[800]!,
  Colors.brown[400]!,
  Colors.blueGrey[400]!,
  Colors.blue[400]!,
  Colors.indigo[400]!,
];

class SelectableContainerGrid extends StatefulWidget {
  const SelectableContainerGrid({Key? key}) : super(key: key);

  @override
  _SelectableContainerGridState createState() =>
      _SelectableContainerGridState();
}

class _SelectableContainerGridState extends State<SelectableContainerGrid> {
  final List<bool> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    kGridElements.forEach((element) {
      _selectedItems.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: _buildElements(),
    );
  }

  List<Widget> _buildElements() {
    List<Widget> ret = [];

    for (var i = 0; i < kGridElements.length; i++) {
      ret.add(SelectableContainer(
        selectedBackgroundColor: kGridElements[i],
        unselectedBackgroundColor: kGridElements[i],
        selectedBorderColor: Theme.of(context).dialogBackgroundColor,
        unselectedBorderColor: Theme.of(context).dialogBackgroundColor,
        selected: _selectedItems[i],
        unselectedIcon: Icons.check_box_outline_blank,
        icon: Icons.check_box,
        iconAlignment: Alignment.topRight,
        iconSize: 24,
        iconColor: Colors.green[400]!,
        onValueChanged: (_) {
          _valueSelected(i);
        },
        child: SizedBox(height: 100, width: 100),
      ));
    }
    return ret;
  }

  void _valueSelected(int index) {
    setState(() {
      _selectedItems[index] = !_selectedItems[index];
    });
  }
}
