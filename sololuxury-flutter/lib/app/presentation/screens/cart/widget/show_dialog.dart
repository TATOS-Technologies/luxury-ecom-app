import '../../../../../all_imports.dart';
import 'dialog_content.dart';

void cartShowDialog(BuildContext context) {
  showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: const DialogContent(),
      );
    },
  );
}
