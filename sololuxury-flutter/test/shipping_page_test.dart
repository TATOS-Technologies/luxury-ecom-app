import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

MyOrdersData data = MyOrdersData(items: [
  MyOrdersDataItem(
      storeName: 'abc Store', emailSent: 1, totalQtyOrdered: 3, totalDue: 423)
], searchCriteria: SearchCriteria(filterGroups: []), totalCount: 1);

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  group('Orders & Shipping page', () {
    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('success case', () async {
      dioAdapter.onGet('/', (server) => server.reply(200, data));

      var response = await dio.get<dynamic>('/');

      MyOrdersData resultData =
          MyOrdersData.fromJson(response.data as Map<String, dynamic>);

      expect(response.statusCode, 200);
      expect(1, resultData.totalCount);
    });
    test('error case', () async {
      dioAdapter.onGet(
          '/', (server) => server.reply(201, {'message': 'error'}));

      var response = await dio.get<dynamic>('/');

      expect(response.statusCode, 201);
      expect({'message': 'error'}, response.data);
    });
  });
}
