import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pingolearn_assignment/themes/color_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool enabled;
  final TextInputType? keyboardType;
  final void Function(String) onFieldChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  int? maxLines;
  int? maxLength;
  final String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    this.labelText,
    required this.controller,
    this.enabled = true,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.inputFormatters,
    required this.onFieldChanged,
    this.focusNode,
    this.validator,
    this.errorText,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isValid = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onChanged: (value) {
        widget.onFieldChanged(value);
      },
      style: TextStyle(
        color: ColorConstants().darkTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        enabled: false,
        fillColor: Colors.white,
        labelText:
            widget.controller?.text.isNotEmpty ?? false ? '' : widget.labelText,
        border: _isValid
            ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              )
            : const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
        counterText: '',
      ),
    );
  }
}
