import 'package:flutter/material.dart';

import '../../../../logic/blok/register_cubit/cubit/register_cubit.dart';
import '../../../helpers/size_config.dart';
import '../../../widgets/space_widgets.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: SizeConfig.defaultSize * 30,
      height: SizeConfig.defaultSize * 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Network error. Try again ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.defaultSize * 2),
            ),
          ),
          VerticalSpace(2),
          IconButton(
            onPressed: () {
              cubit.getPasswordComplexitySetting();
            },
            icon: Icon(
              Icons.replay,
              size: SizeConfig.defaultSize * 6,
            ),
          ),
        ],
      ),
    ));
  }
}
