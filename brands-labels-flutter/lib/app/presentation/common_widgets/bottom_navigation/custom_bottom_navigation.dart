import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.aboutBrandsTxxt.tr.toUpperCase(),
            ),
            const SizedBox(width: 30),
            const Icon(Icons.add),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black12,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.helpAndInfoText.tr.toUpperCase(),
            ),
            const SizedBox(width: 30),
            const Icon(Icons.add),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black12,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.morefromBrandsText.tr.toUpperCase(),
            ),
            const SizedBox(width: 30),
            const Icon(Icons.add),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.newsletterText.tr.toUpperCase(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 46,
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: LanguageConstants.emailAddress.tr,
                        labelStyle: const TextStyle(color: Colors.black54),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Color(0xff000080),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Color(0xff000080),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff000080),
                            ),
                            borderRadius: BorderRadius.circular(0.0))),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color(0xff000080),
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    LanguageConstants.subscribe.tr.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xff000080),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
