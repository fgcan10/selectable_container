library selectable_container;

import 'package:flutter/material.dart';

/// Box that can be tapped.
/// When selected a check Icon appears
class SelectableContainer extends StatefulWidget {
  Color selectedBackgroundColor;
  Color unselectedBackgroundColor;
  Color selectedBorderColor;
  Color unselectedBorderColor;
  Color iconColor;
  int iconSize;
  Widget child;
  int borderSize;
  Function onPressed;
  double unselectedOpacity;
  int opacityAnimationDuration;
  IconData icon;
  Alignment iconAlignment;
  double padding;

  @override
  _SelectableContainerState createState() => _SelectableContainerState();

  SelectableContainer(
      {this.unselectedBackgroundColor,
      this.selectedBackgroundColor,
      this.selectedBorderColor,
      this.unselectedBorderColor,
      @required this.onPressed,
      this.iconSize = 16,
      this.iconColor = Colors.white,
      this.icon,
      this.iconAlignment = Alignment.topRight,
      this.borderSize = 2,
      this.unselectedOpacity = 0.5,
      this.opacityAnimationDuration = 600,
      this.padding = 0,
      this.child});
}

class _SelectableContainerState extends State<SelectableContainer> {
  bool _selected = false;

  void assingDefaultValues() {
    var theme = Theme.of(context);

    this.widget.selectedBackgroundColor =
        this.widget.selectedBackgroundColor == null
            ? theme.dialogBackgroundColor
            : this.widget.selectedBackgroundColor;
    this.widget.unselectedBackgroundColor =
        this.widget.unselectedBackgroundColor == null
            ? theme.dialogBackgroundColor
            : this.widget.unselectedBackgroundColor;
    this.widget.selectedBorderColor = this.widget.selectedBorderColor == null
        ? theme.primaryColor
        : this.widget.selectedBorderColor;
    this.widget.unselectedBorderColor =
        this.widget.unselectedBorderColor == null
            ? theme.primaryColorDark
            : this.widget.unselectedBorderColor;

    this.widget.icon =
        this.widget.icon == null ? Icons.check : this.widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    assingDefaultValues();
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        widget.onPressed();
      },
      child: AnimatedOpacity(
        opacity: _selected ? 1.0 : widget.unselectedOpacity,
        duration: Duration(milliseconds: widget.opacityAnimationDuration),
        child: Container(
          child: Column(
            children: [
              Stack(
                alignment: widget.iconAlignment,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(widget.iconSize / 2),
                    padding: EdgeInsets.all(widget.padding),
                    child: widget.child,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selected
                                ? widget.selectedBorderColor
                                : widget.unselectedBorderColor,
                            width: widget.borderSize.toDouble()),
                        borderRadius: BorderRadius.circular(10),
                        color: _selected
                            ? widget.selectedBackgroundColor
                            : widget.unselectedBackgroundColor),
                  ),
                  Visibility(
                    visible: _selected,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle,
                        color: widget.selectedBorderColor,
                      ),
                      child: Icon(
                        widget.icon,
                        size: widget.iconSize.toDouble(),
                        color: widget.iconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
