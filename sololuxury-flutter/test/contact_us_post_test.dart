import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

var requestJson = {
  "ticketForm": {
    "name": 'shyam',
    "last_name": 'shyam',
    "email": 'shyam@123',
    "phone": 000000922,
    "brand": 'N/A',
    "style": '',
    "keyword": '',
    "image_url": '',
    "remarks": '',
    "customer_id": '',
    "lang_code": ''
  }
};

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  group('Contact US POST request', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('success case', () async {
      dioAdapter.onPost(
          '/', (server) => server.reply(200, {'message': 'success'}),
          data: requestJson);

      var response = await dio.post<dynamic>('/', data: requestJson);

      expect(response.statusCode, 200);

      expect({'message': 'success'}, response.data);
    });
    test('failure case', () async {
      dioAdapter.onPost(
          '/', (server) => server.reply(201, {'message': 'error'}),
          data: requestJson);

      var response = await dio.post<dynamic>('/', data: requestJson);

      expect(response.statusCode, 201);

      expect({'message': 'error'}, response.data);
    });
  });
}
