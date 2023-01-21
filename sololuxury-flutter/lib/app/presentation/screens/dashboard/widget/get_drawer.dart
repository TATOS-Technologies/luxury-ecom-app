import '../../../../../all_imports.dart';
import 'get_drawer_view.dart';

class GetDrawer extends StatelessWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: SizedBox(
          width: Get.width - 40.0,
          child: const GetDrawerView(),
        ),
      ),
    );
  }
}
