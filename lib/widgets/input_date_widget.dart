import 'package:flutter/material.dart';

class InputDateWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onTap;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  // placabus = TextEditingController();
  const InputDateWidget({
    super.key,
    this.controller,
    this.onTap,
    this.labelText,
    this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
            suffixIcon: suffixIcon // const Icon(Icons.calendar_month),
            ),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.blue,
          fontWeight: FontWeight.w800,
        ),
        onTap: onTap,
      ),
    );
  }
}
