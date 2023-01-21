import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class PriceFilter extends StatelessWidget {
  const PriceFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CheckBoxListTileModel> data1 = getData();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(5),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: brownColor)),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: brownColor,
                ),
                Text(
                  LanguageConstants.searchText.tr,
                  style: AppStyle.textStyleUtils400(color: brownColor),
                ),
              ],
            )),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              // <- add
              itemCount: getData().length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: appColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          data1[index].title!,
                          style: AppStyle.textStyleUtils400(),
                        ),
                        value: data1[index].isCheck!,
                        onChanged: (bool? val) {})
                  ],
                );
              }),
        ),
      ],
    );
  }

  List<CheckBoxListTileModel> getData() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(title: "\u{20B9} 500 - 1000", isCheck: true),
      CheckBoxListTileModel(title: "\u{20B9} 1500 - 2000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 2500 - 3000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 3500 - 4000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 4500 - 5000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 5500 - 6000", isCheck: false),
    ];
  }
}
