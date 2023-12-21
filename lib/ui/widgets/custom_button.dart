import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workiom/ui/helpers/app_colors.dart';
import 'package:workiom/ui/widgets/space_widgets.dart';

import '../helpers/size_config.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final String? contentText;
  final double? borderRadius;
  final Color? color;
  final Widget? child;

  const CustomButton({
    super.key,
    this.onTap,
    this.width,
    this.contentText,
    this.borderRadius,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.defaultColor,
      borderRadius: BorderRadius.circular(borderRadius ?? 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        onTap: onTap,
        child: SizedBox(
          width: width ?? SizeConfig.screenWidth,
          height: SizeConfig.defaultSize * 7,
          child: Center(
            child: child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HorizontalSpace(6.5),
                    Text(
                      contentText ?? "No Content",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.defaultSize * 1.9,
                        color: Colors.white,
                      ),
                    ),
                    const HorizontalSpace(6),
                    SvgPicture.asset(
                      "assets/svg/forward.svg",
                      width: 24,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
