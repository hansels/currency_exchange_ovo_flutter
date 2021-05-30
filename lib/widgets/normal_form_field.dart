import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:exchange_currency_ovo_flutter/configs/configs.dart';

class NormalFormField extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(String) onFieldSubmitted;
  final void Function(String) onChanged;
  final void Function() onTap;
  final TextInputType keyboardType;
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
  final double withDivider;

  final String text;

  NormalFormField({
    this.hintText,
    this.text,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
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
    this.withDivider = 1,
  }) {
    _textEditingController.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / withDivider,
      child: TextFormField(
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
        style: const TextStyle(fontSize: 16),
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: decoration ??
            InputDecoration(
              hintText: hintText ?? "",
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        inputFormatters: inputFormatters ?? const [],
      ),
    );
  }
}
