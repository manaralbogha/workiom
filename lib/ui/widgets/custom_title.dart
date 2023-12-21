import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workiom/ui/widgets/space_widgets.dart';

import '../helpers/size_config.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.defaultSize * 2.8,
          ),
        ),
        Row(
          children: [
            Text(
              "Let's start an amazing journey!",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.defaultSize * 1.9,
                height: SizeConfig.defaultSize * .25,
              ),
            ),
            const HorizontalSpace(1),
            SvgPicture.asset("assets/svg/hi.svg")
            // Text("🖐🏼")
          ],
        ),
      ],
    );
  }
}
