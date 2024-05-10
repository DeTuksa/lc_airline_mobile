import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isDisabled;
  final Widget icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Color? indicatorColor;

  const AppIconButton({super.key, required this.text, this.isLoading = false,
    this.onPressed, this.style, this.isDisabled = false, this.indicatorColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: style,
      onPressed: isDisabled || isLoading? null : ()=> onPressed?.call(),
      icon: isLoading ? const SizedBox() : icon,
      label: isLoading ? SizedBox(
        height: 20, width: 20,
        child: CircularProgressIndicator(color: indicatorColor??Colors.white,),
      ) : Text(text, textAlign: TextAlign.center),
    );
  }
}
