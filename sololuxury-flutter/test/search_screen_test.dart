import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:meta_package/api/models/product/product_model.dart';
// import 'package:mockito/mockito.dart';

const productName = 'Women\'s Hat';
const path = '/search';
// Response<dynamic>? response;
// SearchModel searchModel = SearchModel(
//   aggregations: Aggregations(
//     bucketNames: [productName]
//   ),
//   totalCount: 1,
//   items: [SearchItems(
//    customAttributes: [],
//     id: 1
//   )]
// );
ProductModel productModel = ProductModel(
    items: [ProductItem(name: productName, price: 200)],
    searchCriteria: SearchCriteria(filterGroups: [], requestName: 'women'),
    totalCount: 1);

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  group('Fetching the product List (What’s New, Sale, Women)', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('product count', () async {
      dioAdapter.onGet(path, (server) => server.reply(200, productModel));

      var response = await dio.get<dynamic>(path);
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);

      expect(1, data.totalCount);
    });

    test('product name', () async {
      dioAdapter.onGet(path, (server) => server.reply(200, productModel));
      // dioAdapter.onPost(path, (server) =>server.reply(200, productName));

      var response = await dio.get<dynamic>(path);
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);

      expect(productName, data.items?.first.name);
    });

    test('product price', () async {
      dioAdapter.onGet('test', (server) => server.reply(200, productModel));

      var response = await dio.get<dynamic>('test');
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);

      expect(200, data.items?.first.price);
    });

    test('Searching custom text', () async {
      dioAdapter.onPost(
        path,
        (server) => server.reply(200, productModel),
      );

      var response = await dio.post<dynamic>(path);
      ProductModel data =
          ProductModel.fromJson(response.data as Map<String, dynamic>);
      expect(response.statusCode, 200);

      expect('women', data.searchCriteria?.requestName);
    });
    tearDown(() {
      dioAdapter.close();
      dio.close();
    });
  });
}
