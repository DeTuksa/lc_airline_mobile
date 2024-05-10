import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lc_airline/core/presentation/constants/spacer.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';

class AppInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final VoidCallback? toggleEye;
  final KeyboardType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  final bool? showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enabled;
  final String? labelText;
  final double? labelTextFont;
  final dynamic maxLines;
  final Color borderColor;
  final Widget? prefix;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color fillColor;
  final bool isError;
  final String showErrorText;
  final Color enabledBorder;
  final Color focusedBorder;
  final Color labelTextColor;
  final Widget? suffix;
  const AppInput(
      {super.key,
      this.hintText,
      this.validator,
      this.onSaved,
      this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enabled = true,
      this.labelText,
      this.labelTextFont,
      this.suffix,
      this.maxLines = 1,
      this.borderColor = Colors.blueGrey,
      this.onChanged,
      this.prefix,
      this.controller,
      this.inputFormatters,
      this.fillColor = Colors.transparent,
      this.isError = false,
      this.showErrorText = "field can't be empty",
      this.enabledBorder = Colors.blueGrey,
      this.focusedBorder = Colors.blueGrey,
      this.labelTextColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (labelText != null)
        Text(
          '$labelText',
          style:
              TextStyle(color: labelTextColor, fontSize: labelTextFont ?? 16),
        ),
      // if(labelText!=null)AppSpacer.h5,
      Padding(
        padding: const EdgeInsets.all(0),
        child: TextFormField(
            inputFormatters: inputFormatters,
            controller: controller,
            key: key,
            enabled: enabled,
            style: TextStyle(color: labelTextColor, fontSize: 14),
            cursorColor: styleColor,
            obscureText: obscureText,
            maxLines: maxLines,
            onChanged: onChanged,
            decoration: InputDecoration(
              // contentPadding: const EdgeInsets.fromLTRB(25, 20, 20, 20),
              prefixIcon: prefix,
              suffix: suffix,

              fillColor: fillColor,
              filled: true,
              hintStyle:
                  const TextStyle(color: Color(0xFFC0BCBC), fontSize: 14),
              hintText: hintText,
              isDense: true,
              errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: enabledBorder),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: focusedBorder),
              ),
              disabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: borderColor),
              ),
              // contentPadding: EdgeInsets.only(top: 10, bottom: 10),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: toggleEye,
                      child: Icon(
                        showObscureText!
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFFC0C1C3),
                      ),
                    )
                  : const Text(''),
              errorText: isError ? showErrorText : null,
            ),
            validator: validator,
            initialValue: init,
            onSaved: onSaved,
            keyboardType: keyboard == KeyboardType.email
                ? TextInputType.emailAddress
                : keyboard == KeyboardType.number
                    ? TextInputType.number
                    : keyboard == KeyboardType.phone
                        ? TextInputType.phone
                        : TextInputType.text),
      ),
    ]);
  }
}

class DRSecInput extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final VoidCallback? toggleEye;
  final KeyboardType? keyboard;
  final String? init;
  final bool isPassword;
  final Color? isPasswordColor;
  final bool? showObscureText;
  final bool obscureText;
  final Color? styleColor;
  final Color? hintStyleColor;
  final bool enabled;
  final String? labelText;
  final double? labelTextFont;
  final dynamic maxLines;
  final Color borderColor;
  final Widget? prefix;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color fillColor;
  final bool isError;
  final String showErrorText;
  final Color enabledBorder;
  final Color focusedBorder;
  final Color labelTextColor;
  final Widget? suffix;
  final VoidCallback? onEditingComplete;
  final TextCapitalization? textCapitalization;

  const DRSecInput(
      {super.key,
      this.hintText,
      this.validator,
      this.onSaved,
      this.toggleEye,
      this.init,
      this.isPassword = false,
      this.isPasswordColor,
      this.showObscureText,
      this.obscureText = false,
      this.keyboard,
      this.styleColor,
      this.hintStyleColor,
      this.enabled = true,
      this.labelText,
      this.labelTextFont,
      this.onEditingComplete,
      this.maxLines = 1,
      this.borderColor = Colors.blueGrey,
      this.onChanged,
      this.prefix,
      this.suffix,
      this.controller,
      this.inputFormatters,
      this.fillColor = Colors.transparent,
      this.isError = false,
      this.textCapitalization,
      this.showErrorText = "field can't be empty",
      this.enabledBorder = Colors.blueGrey,
      this.focusedBorder = Colors.blueGrey,
      this.labelTextColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (labelText != null)
        Text(
          '$labelText',
          style: TextStyle(
              color: labelTextColor,
              fontSize: labelTextFont ?? 16,
              fontWeight: FontWeight.w500),
        ),
      if (labelText != null) AppSpacer.h10,
      Padding(
        padding: const EdgeInsets.all(0),
        child: TextFormField(
            inputFormatters: inputFormatters,
            controller: controller,
            key: key,
            enabled: enabled,
            style: TextStyle(
                color: labelTextColor,
                fontWeight: FontWeight.w300,
                fontSize: 14),
            cursorColor: styleColor,
            obscureText: obscureText,
            maxLines: maxLines,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
              hintText: hintText,
              prefixIcon: prefix,
              fillColor: const Color(0xFFF1F1F1),
              filled: true,
              hintStyle: TextStyle(
                color: AppTheme.primaryGrey.shade500,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              isDense: true,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              // contentPadding: EdgeInsets.only(top: 10, bottom: 10),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: toggleEye,
                      child: Icon(
                        showObscureText!
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFFC0C1C3),
                      ),
                    )
                  : suffix,
              errorText: isError ? showErrorText : null,
            ),
            validator: validator,
            initialValue: init,
            onSaved: onSaved,
            keyboardType: keyboard == KeyboardType.email
                ? TextInputType.emailAddress
                : keyboard == KeyboardType.number
                    ? TextInputType.number
                    : keyboard == KeyboardType.phone
                        ? TextInputType.phone
                        : TextInputType.text),
      ),
    ]);
  }
}

enum KeyboardType { email, phone, number, text }
