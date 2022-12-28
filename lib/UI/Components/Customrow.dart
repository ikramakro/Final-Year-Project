import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  IconData icon;
  String text;
  String text2;
  CustomRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.text2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xff184a2c),
              borderRadius: BorderRadius.circular(40)),
          child: Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(text),
            const SizedBox(
              height: 8,
            ),
            Text(
              text2,
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
