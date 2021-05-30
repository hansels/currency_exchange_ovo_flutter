import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/configs.dart';

class UsualFormField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(String) onFieldSubmitted;
  final void Function(String) onChanged;
  final void Function() onTap;
  final TextStyle textStyle;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final int maxLines;
  final int maxLength;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final String Function(String) validator;
  final FocusNode focusNode;
  final bool readOnly;
  final bool enabled;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final List<TextInputFormatter> inputFormatters;
  final InputDecoration decoration;
  final TextEditingController controller;
  final bool withTopSpace;

  final String text;

  UsualFormField({
    this.labelText,
    this.hintText,
    this.text,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textStyle,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.textCapitalization,
    this.textInputAction,
    this.validator,
    this.focusNode,
    this.readOnly,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.decoration,
    this.controller,
    this.withTopSpace = false,
  }) {
    _textEditingController.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (withTopSpace) const SizedBox(height: 10),
        TextFormField(
          enabled: enabled ?? true,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          focusNode: focusNode,
          validator: validator,
          controller: controller ?? _textEditingController,
          cursorWidth: 2.5,
          cursorRadius: const Radius.circular(10),
          cursorColor: Configs.primaryColor,
          style: textStyle ?? const TextStyle(fontSize: 16),
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: decoration ??
              InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelText ?? "",
                hintText: hintText ?? "",
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          inputFormatters: inputFormatters ?? const [],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
