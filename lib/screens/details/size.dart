import 'package:flutter/material.dart';
import 'package:pizza_app/components/text_toggle_buttons.dart';

typedef OnSizeChange = void Function(String size);

class Size extends StatelessWidget {
  final options = [
    'Small',
    'Medium',
    'Large',
  ];

  final String size;
  final OnSizeChange onSizeChange;

  Size({Key key, this.size, this.onSizeChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: options,
            isSelected: [
              size == options[0],
              size == options[1],
              size == options[2],
            ],
            onPressed: (int index) {
              onSizeChange(options[index]);
            },
          ),
        ],
      ),
    );
  }
}
