import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

var requestJson = {
  "ticketForm": {
    "name": 'abc',
    "last_name": 'cde',
    "email": 'abc@cde.cm',
    "phone": '1234567890',
    "brand": 'abc',
    "style": 'xyz',
    "keyword": 'xyz',
    "image_url": 'abc.com',
    "remarks": 'null',
    "customer_id": '1345',
    "lang_code": '567'
  }
};

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  group('SpecialRequestScreen -', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('success', () async {
      dioAdapter.onGet(
          '/',
          (server) =>
              server.reply(200, {"result": "success", 'data': requestJson}));

      var response = await dio.post<dynamic>('/', data: requestJson);

      expect(response.statusCode, 200);
    });

    test('failure', () async {
      dioAdapter.onGet('/',
          (server) => server.reply(201, {"result": "failure", 'data': null}));

      var response = await dio.post<dynamic>('/', data: requestJson);

      expect(response.statusCode, 201);
    });

    tearDown(() {
      dioAdapter.close();
      dio.close();
    });
  });
}
