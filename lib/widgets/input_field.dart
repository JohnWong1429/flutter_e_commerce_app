import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool hidePassword;
  final bool hasError;

  const InputField({
    super.key,
    this.controller,
    this.labelText,
    this.hidePassword = false,
    this.hasError = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
        border: const UnderlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      obscureText: widget.hidePassword,
    );
  }
}
