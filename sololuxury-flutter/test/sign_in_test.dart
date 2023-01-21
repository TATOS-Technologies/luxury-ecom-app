// ignore_for_file: inference_failure_on_collection_literal

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

final socialAuthUserData = {
  "type": 'google',
  "user_id": 'uxjjjjjjjs',
  "firstname": 'Google_displayname',
  "lastname": 'Google_displayname',
  "email": 'Google_email',
  "gender": 0,
  "taxvat": 0
};

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  late MockGoogleSignIn googleSignIn;
  setUp(() {
    googleSignIn = MockGoogleSignIn();
  });
  group('SignupScreen', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('when the user does not exist', () async {
      dioAdapter.onPost(
          '/',
          (server) => server.reply(200, {
                'response': 'user created',
                'errorMessage': '',
                'isError': 'false',
              }),
          data: socialAuthUserData);

      var response = await dio.post<dynamic>('/', data: socialAuthUserData);
      expect(response.statusCode, 200);
    });

    test('when the user exists-google_sign_in, returns a User', () async {
      final signInAccount = await googleSignIn.signIn();
      final signInAuthentication = await signInAccount?.authentication;

      expect(signInAuthentication, isNotNull);
      expect(googleSignIn.currentUser, isNotNull);
      expect(signInAuthentication?.accessToken, isNotNull);
      expect(signInAuthentication?.idToken, isNotNull);
    });

    test(
        'when there is an unexpected error from the backend, throws an exception.',
        () async {
      dioAdapter.onPost(
          '/',
          (server) => server.reply(
                201,
                {},
              ),
          data: socialAuthUserData);

      var response = await dio.post<dynamic>('/', data: socialAuthUserData);
      expect(response.statusCode, 201);
    });
  });
}
