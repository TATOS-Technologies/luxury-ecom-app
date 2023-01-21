import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
        child: Image.asset(
          AppAsset.drawerIcon,
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Image.asset(
          AppAsset.veraLussoLogo,
          height: 60,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 18,
            ),
            child: Image.asset(
              AppAsset.searchIcon,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 18,
            ),
            child: Image.asset(
              AppAsset.heartIcon,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 18,
            ),
            child: Image.asset(
              AppAsset.bagIcon,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
