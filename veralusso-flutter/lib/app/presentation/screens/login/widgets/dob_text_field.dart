import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/colors.dart';

class DobTextField extends StatelessWidget {
  const DobTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showCalendar(context);
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: appColor, width: 1.15),
        ),
      ),
    );
  }
}
