import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Color? indicatorColor;

  const AppButton({super.key, required this.text, this.isLoading = false,
    this.onPressed, this.style, this.isDisabled = false, this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: isDisabled || isLoading? null : ()=> onPressed?.call(),
      child: isLoading ? SizedBox(
        height: 20, width: 20,
        child: CircularProgressIndicator(color: indicatorColor??Colors.white,),
      ) : Text(text, textAlign: TextAlign.center),
    );
  }
}