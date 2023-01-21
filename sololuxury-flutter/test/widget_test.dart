// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/address_book/widget/details_button.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('CommonTextField', (WidgetTester tester) async {
    Widget widget = MaterialApp(
        home: Card(
            child: ScreenUtilInit(
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return const CommonTextField();
      },
    )));
    await tester
        .pumpWidget(MediaQuery(data: const MediaQueryData(), child: widget));

    Finder finder = find.byType(TextFormField);
    expect(find.byType(TextFormField), findsOneWidget);
    debugPrint("TextFormField");

    await tester.enterText(finder, LanguageConstants.yourEmail1Text.tr);
    expect(find.text(LanguageConstants.yourEmail1Text.tr), findsOneWidget);
    debugPrint("Enter Text");

    await tester.pumpAndSettle();
  });

  testWidgets('DetailsButton', (WidgetTester tester) async {
    Widget widget = const MaterialApp(
        home: Card(
            child: DetailsButton(
      text: '',
      value: 1,
    )));
    await tester
        .pumpWidget(MediaQuery(data: const MediaQueryData(), child: widget));

    Finder finder = find.byType(GestureDetector);
    expect(finder, findsOneWidget);
    debugPrint("GestureDetector");

    await tester.tap(finder);
    debugPrint("GestureDetector tap");

    await tester.pumpAndSettle();
  });
}
