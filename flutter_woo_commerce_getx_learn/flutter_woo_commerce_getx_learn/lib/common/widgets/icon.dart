import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

enum IconWidgetType { icon, svg, image, url }

/// 默认尺寸
const _letSize = 24.0;

/// 图标组件
class IconWidget extends StatelessWidget {
  /// 图标类型
  final IconWidgetType type;

  /// 图标数据
  final IconData? iconData;

  /// 图片路径
  final String? assetName;

  /// 图片 url
  final String? imageUrl;

  /// 尺寸
  final double? size;

  /// 宽
  final double? width;

  /// 高
  final double? height;

  /// 颜色
  final Color? color;

  /// 是否小圆点
  final bool? isDot;

  /// Badge 文字
  final String? badgeString;

  /// 图片 fit
  final BoxFit? fit;

  const IconWidget({
    super.key,
    this.type = IconWidgetType.icon,
    this.iconData,
    this.assetName,
    this.imageUrl,
    this.size,
    this.width,
    this.height,
    this.color,
    this.isDot,
    this.badgeString,
    this.fit,
  });

  const IconWidget.icon(this.iconData,
      {super.key,
      this.type = IconWidgetType.icon,
      this.size = _letSize,
      this.width,
      this.height,
      this.color,
      this.isDot,
      this.badgeString,
      this.assetName,
      this.imageUrl,
      this.fit});

  // ignore: prefer_const_constructors_in_immutables
  IconWidget.image(this.assetName,
      {super.key,
      this.type = IconWidgetType.image,
      this.size = _letSize,
      this.width,
      this.height,
      this.color,
      this.isDot,
      this.badgeString,
      this.iconData,
      this.imageUrl,
      this.fit});

  // ignore: prefer_const_constructors_in_immutables
  IconWidget.svg(this.assetName,
      {super.key,
      this.type = IconWidgetType.svg,
      this.size = _letSize,
      this.width,
      this.height,
      this.color,
      this.isDot,
      this.badgeString,
      this.iconData,
      this.imageUrl,
      this.fit});

  // ignore: prefer_const_constructors_in_immutables
  IconWidget.url(this.imageUrl,
      {super.key,
      this.type = IconWidgetType.url,
      this.size = _letSize,
      this.width,
      this.height,
      this.color,
      this.isDot,
      this.badgeString,
      this.iconData,
      this.assetName,
      this.fit});

  @override
  Widget build(BuildContext context) {
    Widget? icon;

    switch (type) {
      case IconWidgetType.icon:
        icon = Icon(
          iconData,
          size: size,
          color: color ?? AppColors.secondary,
        );
        break;
      case IconWidgetType.svg:
        debugPrint(assetName);
        icon = SvgPicture.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          // color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.image:
        debugPrint(assetName);
        icon = Image.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.url:
        debugPrint(imageUrl);
        icon = Image.network(
          imageUrl!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      default:
        return const SizedBox();
    }

    // 圆点
    if (isDot == true) {
      return Badge(
        position: BadgePosition.bottomEnd(bottom: 0, end: -2),
        child: icon,
      );
    }

    if (badgeString != null) {
      return Badge(
        badgeContent: Text(
          badgeString!,
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 9,
          ),
        ),
        position: BadgePosition.topEnd(top: -7, end: -8),
        child: icon,
      );
    }
    return icon;
  }
}
