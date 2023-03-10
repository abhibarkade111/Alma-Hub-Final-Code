import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String initialValue;
  final String placeholderText;
  final int minLines;
  final int maxLines;

  const InputField(
      {required Key key,
      this.initialValue = "",
      this.placeholderText = "",
      this.minLines = 1,
      this.maxLines = 1,
      required TextEditingController controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        initialValue: initialValue,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholderText,
            hintStyle: const TextStyle(fontSize: 15, color: Color(0xFF8F8F9E))),
      ),
    );
  }
}
