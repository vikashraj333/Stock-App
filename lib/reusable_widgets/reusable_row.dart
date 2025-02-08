import 'package:flutter/material.dart';
// to display stocks details in details screen
class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
             
            ],
          ),
        ],
      ),
    );
  }
}
