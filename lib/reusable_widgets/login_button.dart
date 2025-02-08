import 'package:flutter/material.dart';
// circular image button for sign in on login screen
class CircularImageButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onPressed;
  final String text;

  const CircularImageButton({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
