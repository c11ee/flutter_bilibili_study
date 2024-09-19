import 'package:demo/datas/home_banner_data.dart';
import 'package:demo/pages/home/home_vm.dart';
// import 'package:demo/pages/web_view_page.dart';
import 'package:demo/route/route_utils.dart';
import 'package:demo/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<BannerItemData>? bannerList;

  @override
  void initState() {
    super.initState();
    initBannerData();
  }

  Future initBannerData() async {
    bannerList = await HomeViewModel.getBanner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // 基本创建页面都使用 Scaffold
    return Scaffold(
      // 安全区域内
      body: SafeArea(
        /// 滚动视图
        /// 需要知道子组件的高度
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              // 使用 `Expanded` 填充所有空白区
              ListView.builder(
                // 设为 true, 计算所有子组件的高度，从而导致 `SingleChildScrollView` 知道子组件的高度
                shrinkWrap: true,
                // 禁止 ListView 的滑动事件，由 `SingleChildScrollView` 接管
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _listItemView();
                },
                itemCount: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItemView() {
    // InkWell() 增加水波纹效果
    return GestureDetector(
      onTap: () {
        RouteUtils.pushForNamed(
          context,
          RoutePath.webViewPage,
          arguments: {"name": "ccc"},
        );

        // Navigator.pushNamed(context, RoutePath.webViewPage);

        // // 在 MaterialPageRoute 中的 settings 设置路由参数
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return const WebViewPage(title: "首页跳转来的");
        // }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.r, left: 10.w, right: 10.r),
        padding:
            EdgeInsets.only(top: 15.h, bottom: 15.r, left: 10.w, right: 10.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5.r),
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Column(
          children: [
            // 顶部
            Row(
              children: [
                // 图像圆角
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    "https://images.pexels.com/photos/561463/pexels-photo-561463.jpeg",
                    width: 30.r,
                    height: 30.r,
                    // 让图片填充完整
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: const Text(
                    "作者",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: const Text(
                    "2024-8-13",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Text(
                  "置顶",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
            Row(
              children: [
                Text(
                  "分类",
                  style: TextStyle(color: Colors.green, fontSize: 12.sp),
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/collect.png",
                  width: 30.r,
                  height: 30.r,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Swiper(
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          itemCount: bannerList?.length ?? 0,
          itemBuilder: (context, index) {
            return SizedBox(
              // margin: EdgeInsets.all(15.r),
              // 宽度撑满
              // width: double.infinity,
              height: 150.h,
              // color: Colors.lightBlue,
              child: Image.network(
                bannerList?[index].imagePath ?? "",
                fit: BoxFit.fill,
              ),
            );
          }),
    );
  }
}
