import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';
import 'package:get/get.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX();

  // 主视图
  Widget _buildView() {
    DateTime? lastPressedAt;
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop:  () async {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 1)) {
          lastPressedAt = DateTime.now();
          Loading.toast('Press again to exit');
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          // 导航栏
          bottomNavigationBar: GetBuilder<MainController>(
            id: 'navigation',
            builder: (controller) {
              return BuildNavigation(
                currentIndex: controller.currentIndex,
                items: [
                  // 首页
                  NavigationItemModel(
                    label: LocaleKeys.tabBarHome.tr,
                    icon: AssetsSvgs.navHomeSvg,
                  ),

                  // 购物车
                  NavigationItemModel(
                    label: LocaleKeys.tabBarCart.tr,
                    icon: AssetsSvgs.navCartSvg,
                    count: 3,
                  ),

                  // 信息
                  NavigationItemModel(
                    label: LocaleKeys.tabBarMessage.tr,
                    icon: AssetsSvgs.navMessageSvg,
                    count: 9,
                  ),


                  // 我的
                  NavigationItemModel(
                    label: LocaleKeys.tabBarProfile.tr,
                    icon: AssetsSvgs.navProfileSvg,
                  ),
                ],
                onTap: controller.onJumpToPage, // 切换tab事件
              );
            },
          ),

          // 主体内容
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onIndexChanged,
            children: const [
              // 加入空页面占位
              HomePage(),
              CartIndexPage(),
              MsgIndexPage(),
              MyIndexPage(),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}
