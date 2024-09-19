import 'package:demo/datas/home_banner_data.dart';
import 'package:dio/dio.dart';

class HomeViewModel {
  static Future<List<BannerItemData>?> getBanner() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
      method: "GET",
      baseUrl: "https://www.wanandroid.com/",
      // 连接超时 30s
      connectTimeout: const Duration(seconds: 30),
      // 接收超时
      receiveTimeout: const Duration(seconds: 30),
      // 发送超时
      sendTimeout: const Duration(seconds: 30),
    );
    Response response = await dio.get("banner/json");
    HomeBannerData bannerData = HomeBannerData.fromJson(response.data);
    if (bannerData.data != null) {
      return bannerData.data;
    } else {
      return [];
    }
  }
}
