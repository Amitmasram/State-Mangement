import 'package:flutter/material.dart';
import 'package:provider_mvvm/resources/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(color: AppColors.white),
                ),
        ),
      ),
    );
  }
}
