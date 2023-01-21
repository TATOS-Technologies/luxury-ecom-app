import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class CheckBoxContainer extends StatelessWidget {
  final String text;
  const CheckBoxContainer(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
              border: Border.all(color: appColorButton, width: 1.5)),
          child: const Icon(
            Icons.check,
            color: appColorButton,
            size: 12,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppStyle.textStyleUtils500_12(color: appColorButton),
        )
      ],
    );
  }
}
