import 'package:flutter/material.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';

class AppOutlinedIconButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isDisabled;
  final Widget icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Color? indicatorColor;

  const AppOutlinedIconButton({super.key, required this.text, this.isLoading = false,
    this.onPressed, this.style, this.isDisabled = false, this.indicatorColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: style??OutlinedButton.styleFrom(
          side: BorderSide(width: 1, color: AppTheme.primary)
      ),
      onPressed: isDisabled || isLoading? null : ()=> onPressed?.call(),
      icon: isLoading ? const SizedBox() : icon,
      label: isLoading ? SizedBox(
        height: 20, width: 20,
        child: CircularProgressIndicator(color: indicatorColor??Colors.white,),
      ) : Text(text, textAlign: TextAlign.center),
    );
  }
}