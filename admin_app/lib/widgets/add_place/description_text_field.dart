import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  final String? intialValue;
  final void Function(String)? onChanged; // Changed to accept nullable String

  const DescriptionTextField({Key? key, this.onChanged, this.intialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: intialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
      maxLines: null, // Allow dynamic expansion
    );
  }
}
