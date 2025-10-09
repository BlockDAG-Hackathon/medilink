import 'package:flutter/material.dart';

class MicrophoneTextArea extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onMicrophonePressed;
  final double? height;

  MicrophoneTextArea({
    super.key,
    required this.hintText,
    this.onTextChanged,
    this.onMicrophonePressed,
    this.height
  });

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Defines the grey border style
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(
        color: Colors.grey, // Grey border
        width: 1.0,
      ),
    );

    return Container(
      height: height ?? 100,
      child: Stack(
        children: [
          TextField(
            controller: _controller,
            maxLines: 5, // Allow multiple lines of text
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // White background
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
              contentPadding: const EdgeInsets.fromLTRB(
                16,
                16,
                50,
                16,
              ), 
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
          ),

          Positioned(
            bottom: 4.0,
            right: 4.0,
            child: IconButton(
              icon: const Icon(
                Icons.mic_none,
                color: Colors.grey, // Icon color
                size: 28,
              ),
              onPressed:
                  onMicrophonePressed ,
              // Ensure the tap area is only the icon button size
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }
}
