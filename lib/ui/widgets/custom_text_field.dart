import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workiom/ui/widgets/space_widgets.dart';

import '../helpers/app_colors.dart';
import '../helpers/size_config.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final String? hintText, labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? suffixIconOnTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;

  final int? maxLength;
  final String? initialValue;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    this.width,
    this.hintText,
    this.suffixIconOnTap,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.initialValue,
    this.autofocus = false,
    this.maxLength,
    this.textInputAction,
    this.onFieldSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.defaultSize * 2,
            ),
          ),
          Row(
            children: [
              prefixIcon as Widget,
              // Icon(prefixIcon, size: 22),
              const HorizontalSpace(1),
              SizedBox(
                width: SizeConfig.defaultSize * 34,
                child: TextFormField(
                  controller: controller,
                  autofocus: autofocus,
                  initialValue: initialValue,
                  textInputAction: textInputAction,
                  obscureText: obscureText ?? false,
                  keyboardType: keyboardType,
                  maxLength: maxLength,
                  validator: validator ??
                      (value) {
                        if (value?.isEmpty ?? true) {
                          return 'required';
                        }
                        return null;
                      },
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  decoration: InputDecoration(
                    hintText: hintText,
                    suffixIcon: suffixIcon,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
