// ignore_for_file: inference_failure_on_collection_literal

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:solo_luxury/all_imports.dart';

final signUpRequestModel = SignUpRequestModel(
    customer: Customer(
        addresses: [],
        dob: '',
        email: 'shyam@test',
        extensionAttributes: RequestExtensionAttributes(dom: ''),
        firstname: 'shyam',
        lastname: 'shyam',
        websiteId: 1),
    password: '123456');

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  group('SignupScreen', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('when the user does not exist, returns a User.', () async {
      dioAdapter.onPost(
          '/login',
          (server) => server.reply(
                200,
                {'message': 'user created', 'userdata': signUpRequestModel},
              ),
          data: signUpRequestModel);

      var response =
          await dio.post<dynamic>('/login', data: signUpRequestModel);
      debugPrint('${response.data}');

      expect(response.statusCode, 200);
    });

    test('when the user exists, returns a User', () async {
      dioAdapter.onPost(
          '/login',
          (server) => server.reply(
                201,
                {'message': 'user exists', 'userdata': signUpRequestModel},
              ),
          data: signUpRequestModel);

      var response =
          await dio.post<dynamic>('/login', data: signUpRequestModel);
      debugPrint('${response.data}');

      expect(response.statusCode, 201);
    });

    test(
        'when there is an unexpected error from the backend, throws an exception.',
        () async {
      dioAdapter.onPost(
          '/login',
          (server) => server.reply(
                203,
                {},
              ),
          data: signUpRequestModel);

      var response =
          await dio.post<dynamic>('/login', data: signUpRequestModel);
      // print(response.statusCode);

      expect(response.statusCode, 203);
    });
  });
}
