// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable

import '../../../../../../all_imports.dart';
import '../../../../../core/const/app_style.dart';

class RowOne extends StatelessWidget {
  String text;
  String data;

  RowOne({
    Key? key,
    required this.text,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Text(
            text,
            style: AppStyle.textStyleUtils500(size: 15),
          ),
        ),
        Expanded(
          child: Text(
            data,
            style: AppStyle.textStyleUtils400(size: 14.0),
          ),
        ),
      ],
    );
  }
}

class RowTwo extends StatelessWidget {
  String text;
  String data;

  RowTwo({
    Key? key,
    required this.text,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Text(
            text,
            style: AppStyle.textStyleUtils500(size: 15.0),
          ),
        ),
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            border: Border.all(
              color: wishListBorder,
              width: 1,
            ),
          ),
          child: Image.network(
            data,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
