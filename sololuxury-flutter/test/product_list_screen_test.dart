import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:meta_package/api/api_repository/product_list_api_repository.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:mockito/mockito.dart';

class MockPproductListAPIRepository extends Mock
    implements ProductListAPIRepository {}

ProductModel productModel = ProductModel(
    items: [ProductItem(name: 'hat', price: 200)],
    searchCriteria: SearchCriteria(filterGroups: [], requestName: 'women'),
    totalCount: 1);

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  group('ProductListScreen -', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });

    test('product count', () async {
      dioAdapter.onGet('/', (server) => server.reply(200, productModel));

      var response = await dio.get<dynamic>('/');
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);
      expect(1, data.totalCount);
    });

    test('child category count and display', () async {
      dioAdapter.onGet('/', (server) => server.reply(200, productModel));

      var response = await dio.get<dynamic>('/');
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);
      expect(1, data.items?.length);

      for (var element in data.items!) {
        debugPrint("product name: ${element.name.toString()}");
      }
    });
  });
}
