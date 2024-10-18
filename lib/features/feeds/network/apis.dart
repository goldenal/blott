import 'package:blott_app/features/feeds/domain/data_model.dart';
import 'package:blott_app/util/dioSetup.dart';
import 'package:dio/dio.dart';

///news?category=general
///search?q=apple&exchange=US&token=
Future<List<FeedsData>> fetchNews() async {
  try {
    final res = await ApiCall.getInstance().getReq(
      "news?category=general&token=crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg&limit=20",
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          "Accept": "*/*"
        },
      ),
    );
    List<FeedsData> parsedData = List<FeedsData>.from(
        (res.data as List).map((x) => FeedsData.fromJson(x)));
    return parsedData;
  } on DioException catch (e) {
    rethrow;
  }
}
