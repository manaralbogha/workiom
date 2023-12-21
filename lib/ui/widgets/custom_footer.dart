import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/size_config.dart';
import 'space_widgets.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Stay organized with"),
        const HorizontalSpace(1.5),
        SvgPicture.asset(
          "assets/svg/logo.svg",
          width: SizeConfig.defaultSize * 11.5,
        ),
      ],
    );
  }
}
