import 'package:flutter/material.dart';
import 'package:todo_app/utilities/const/text_style.dart';
import 'package:todo_app/utilities/utils.dart';

import '../../../utilities/const/image.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgNoDataFound
              ,fit: BoxFit.contain,),
            Utils.verticalSpace(10),
            const Text("No Data Found", style: txtStyleNoDataFoundPrimary,),
            Utils.verticalSpace(3),
            const Text("Click on + icon to add TODO item", style: txtStyleNoDataFoundSecondary,)
          ],
        ),
      ),
    );
  }
}
