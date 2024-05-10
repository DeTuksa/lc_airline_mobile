import 'package:flutter/material.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Color? indicatorColor;
  final Color? color;
  const AppOutlinedButton({super.key, required this.text,
    this.isLoading = false, this.onPressed, this.isDisabled = false, this.style, this.indicatorColor, this.color});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: style??OutlinedButton.styleFrom(
          side: BorderSide(color: isDisabled? AppTheme.disabledColor : color ?? AppTheme.primary),
        foregroundColor: color ?? AppTheme.primary
      ),
      onPressed: isDisabled || isLoading? null : ()=> onPressed?.call(),
      child: isLoading ? SizedBox(
        height: 20, width: 20,
        child: CircularProgressIndicator(color: indicatorColor??AppTheme.primary,),
      ) : Text(text, textAlign: TextAlign.center),
    );
  }
}