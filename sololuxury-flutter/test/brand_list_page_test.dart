import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';

BrandModel brandModel = BrandModel(
  brandId: 'puma',
  attributeId: '',
  name: 'Shoe',
  description: 'shoe',
  urlKey: '',
  logoPath: '',
  sortOrder: '',
  isActive: '',
  isFeatured: '',
  seoTitle: '',
  seoDesc: '',
  seoKeyword: '',
  updatedAt: DateTime.now(),
  createdAt: DateTime.now(),
);

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  group('Brand List', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('count', () async {
      dioAdapter.onGet(
          '/', (server) => server.reply(200, [brandModel, brandModel]));

      var response = await dio.get<dynamic>('/');

      expect(response.statusCode, 200);

      final List jsonArray = response.data as List;

      expect(jsonArray.length, 2);
    });
  });
}
