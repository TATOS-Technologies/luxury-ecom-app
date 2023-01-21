import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:meta_package/api/models/product/product_model.dart';

const productName = 'Women\'s Hat';
const path = '/search';

ProductModel productModel = ProductModel(
    items: [ProductItem(name: productName, price: 200)],
    searchCriteria: SearchCriteria(filterGroups: [], requestName: 'women'),
    totalCount: 1);

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  group('ProductDetailScreen', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('itemcount', () async {
      dioAdapter.onGet(path, (server) => server.reply(200, productModel));

      var response = await dio.get<dynamic>(path);
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);

      expect(1, data.totalCount);
    });

    tearDown(() {
      dioAdapter.close();
      dio.close();
    });
  });
}
