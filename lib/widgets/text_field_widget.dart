import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final bool autoFocus;

  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;

  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.autoFocus = false,
    this.style,
    this.hintStyle,
    this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autoFocus,
      decoration: InputDecoration(
        fillColor: kWhite,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: kBorderColor),
        ),
        contentPadding: const EdgeInsets.all(5),
        hintStyle: hintStyle,
        errorStyle: errorStyle,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kBorderColor), borderRadius: BorderRadius.circular(8.0)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryRed), borderRadius: BorderRadius.circular(8.0)),
      ),
      style: style,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [LengthLimitingTextInputFormatter(2), FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) => _onChanged(context, value, controller),
      onTap: () => _moveCursorToLast(controller),
    );
  }

  void _onChanged(BuildContext context, String value, TextEditingController controller) {
    if (value.isNotEmpty) {
      _selectAllText(controller, value.substring(value.length - 1));
      FocusScope.of(context).nextFocus();
    }

    _combileNumber();
  }

  void _combileNumber() {}

  void _selectAllText(TextEditingController controller, String value) {
    controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
    controller.text = value;
  }

  void _moveCursorToLast(TextEditingController controller) {
    final cursorPosition = TextSelection.collapsed(offset: controller.text.length);
    controller.selection = cursorPosition;
  }
}

const Color kWhite = Color(0xFFFFFFFF);
const Color kPrimaryRed = Color(0xFFF91414);
const Color kBorderColor = Color(0xFFE8EBEE);
