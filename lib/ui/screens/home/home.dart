import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workiom/ui/helpers/size_config.dart';
import 'package:workiom/ui/widgets/custom_footer.dart';
import 'package:workiom/ui/widgets/space_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: SizeConfig.defaultSize * 35),
              child: SvgPicture.asset("assets/svg/home.svg")),
          VerticalSpace(30),
          CustomFooter(),
        ],
      )),
    );
  }
}
