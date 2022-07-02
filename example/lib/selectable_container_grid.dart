import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

final List<Color> kGridElements = [
  Colors.grey[50]!,
  Colors.grey[200]!,
  Colors.grey[400]!,
  Colors.brown[100]!,
  Colors.brown[200]!,
  Colors.brown[400]!,
];

class SelectableContainerGrid extends StatefulWidget {
  const SelectableContainerGrid({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectableContainerGridState createState() =>
      _SelectableContainerGridState();
}

class _SelectableContainerGridState extends State<SelectableContainerGrid> {
  final List<bool> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    for (var element in kGridElements) {
      _selectedItems.add(false);
    }
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
        selectedBackgroundColorIcon: Theme.of(context).dialogBackgroundColor,
        unselectedBackgroundColorIcon: Theme.of(context).dialogBackgroundColor,
        selected: _selectedItems[i],
        unselectedIcon: Icons.check_box_outline_blank,
        icon: Icons.check_box,
        iconAlignment: Alignment.topRight,
        iconSize: 24,
        iconColor: Colors.deepOrange[400]!,
        onValueChanged: (_) {
          _valueSelected(i);
        },
        topMargin: 5.0,
        leftMargin: 10.0,
        rightMargin: 10.0,
        bottomMargin: 10.0,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'images/dog$i.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
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
