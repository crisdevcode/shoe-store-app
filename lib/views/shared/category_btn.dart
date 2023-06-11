import 'package:flutter/material.dart';
import 'package:shoe_store/views/shared/app_style.dart';

class CategoryBtn extends StatelessWidget {
  final String label;
  final Color buttonColor;
  final void Function()? onPress;

  const CategoryBtn({
    super.key, 
    required this.label,
    required this.buttonColor, 
    this.onPress, 
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: buttonColor,
            style: BorderStyle.solid
          ),
          borderRadius: const BorderRadius.all(Radius.circular(9))
        ),
        child: Center(
          child: Text(
            label,
            style: appStyle(20, buttonColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}