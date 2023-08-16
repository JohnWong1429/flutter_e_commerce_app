import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool hidePassword;
  final bool hasError;
  final Function(String)? onChange;
  final String? errorText;
  final bool isEnable;
  final Widget? suffix;
  final BoxConstraints? suffixIconConstraints;

  const InputField({
    super.key,
    this.controller,
    this.labelText,
    this.hidePassword = false,
    this.hasError = false,
    this.onChange,
    this.errorText,
    this.isEnable = true,
    this.suffix,
    this.suffixIconConstraints,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  late bool _showClearButton;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _showClearButton = _controller.text.isNotEmpty;
    _controller.addListener(_listener);
  }

  void _listener() {
    if (_showClearButton && _controller.text.isEmpty) {
      setState(() {
        _showClearButton = false;
      });
    } else if (!_showClearButton && _controller.text.isNotEmpty) {
      setState(() {
        _showClearButton = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
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
          style: const TextStyle(
            fontSize: 28,
          ),
          controller: _controller,
          enabled: widget.isEnable,
          decoration: InputDecoration(
            suffix: _controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                    iconSize: 20,
                  )
                : widget.suffix,
            suffixIconConstraints: widget.suffixIconConstraints,
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
              vertical: 0,
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
