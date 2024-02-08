import 'package:flutter/material.dart';

class RegionInput extends StatelessWidget {
  final String labelText;
  final void Function(String?)? onChanged; // Changed to accept nullable String

  const RegionInput({
    Key? key,
    required this.labelText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged, // Pass the onChanged callback directly
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
