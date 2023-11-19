import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.textColor
  });

  final IconData icon;
  final String text;
  final Color color,textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      minWidth: 150,
      height: 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      color: color,
      child: Row(
        children: [
          Icon(icon,
            color: textColor
            ,),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
                color: textColor
            ),

          ),
        ],
      ),
    );
  }
}