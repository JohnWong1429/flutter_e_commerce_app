import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool hidePassword;
  final bool hasError;
  final Function(String?)? onChange;
  final String? errorText;
  final bool isEnable;

  const InputField({
    super.key,
    this.controller,
    this.labelText,
    this.hidePassword = false,
    this.hasError = false,
    this.onChange,
    this.errorText,
    this.isEnable = true,
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
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          enabled: widget.isEnable,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: 20,
              color: widget.hasError ? Colors.red : Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.hasError
                    ? Colors.red
                    : const Color.fromARGB(255, 88, 88, 88),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.hasError
                    ? Colors.red
                    : const Color.fromARGB(255, 88, 88, 88),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
          ),
          obscureText: widget.hidePassword,
          cursorColor: widget.hasError
              ? Colors.red
              : const Color.fromARGB(255, 88, 88, 88),
          onChanged: widget.onChange,
        ),
        if (widget.hasError && widget.errorText != null) ...[
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                widget.errorText!,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ]
      ],
    );
  }
}
