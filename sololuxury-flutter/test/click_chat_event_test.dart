import 'package:flutter_test/flutter_test.dart';
import 'package:livechatt/livechatt.dart';
import 'package:mockito/mockito.dart';

class MockLivechat extends Mock implements Livechat {
  dynamic beginChat(
    String licenseNo,
    String groupId,
    String visitorName,
    String visitorEmail,
  ) {
    return 'success';
  }
}

void main() {
  late MockLivechat mockLivechat;
  setUp(() {
    mockLivechat = MockLivechat();
  });
  group('clickChatEvent', () {
    test('Live chat event success', () {
      var result =
          mockLivechat.beginChat('123', '1', 'username', 'shyam@38.com');

      expect(result, 'success');
    });
  });
}
