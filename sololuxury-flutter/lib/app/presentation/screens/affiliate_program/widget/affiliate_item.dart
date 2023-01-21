import 'package:flutter_html/flutter_html.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';

import '../../../../../all_imports.dart';

class AffiliateItem extends StatelessWidget {
  const AffiliateItem({Key? key, required this.affiliateData})
      : super(key: key);
  final CmsText affiliateData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineBodyOneBaseWidget(
          title: affiliateData.title,
          titleColor: Colors.black,
          titleTextAlign: TextAlign.center,
          underline: true,
          fontSize: 16.0,
        ),
        const SizedBox(height: 10),
        Html(data: affiliateData.description)
      ],
    );
  }
}
