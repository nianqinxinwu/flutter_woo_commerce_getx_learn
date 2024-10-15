import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

enum ImageWidgetType { asset, network, file }

class ImageWidget extends StatelessWidget {

  /// 网址
  final String url;

  /// 类型
  final ImageWidgetType type;

  /// 圆角
  final double? radius;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 自适应方式
  final BoxFit? fit;

  /// 占位图
  final Widget? placeholder;

  /// 背景颜色
  final Color? backgroundColor;

  /// builder 函数
  final Widget Function(
    BuildContext context,
    ImageProvider provider,
    Widget completed,
    Size? size,
  )? builder;

  const ImageWidget({
    super.key,
    required this.url,
    required this.type,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.backgroundColor,
    this.builder,
  });

  const ImageWidget.url(
    this.url,{
      super.key,
      this.radius,
      this.width,
      this.height,
      this.fit,
      this.placeholder,
      this.backgroundColor,
      this.builder,
      this.type = ImageWidgetType.network,
    }
  );

  const ImageWidget.asset(
    this.url,{
      super.key,
      this.radius,
      this.width,
      this.height,
      this.fit,
      this.placeholder,
      this.backgroundColor,
      this.builder,
      this.type = ImageWidgetType.asset,
    }
  );

  const ImageWidget.file(
      this.url,{
        super.key,
        this.radius,
        this.width,
        this.height,
        this.fit,
        this.placeholder,
        this.backgroundColor,
        this.builder,
        this.type = ImageWidgetType.file,
    }
  );

  Widget get _placeholder =>
    placeholder ??
    IconWidget.image('assets/images/default.png',
    size: 36,
  );

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(
      Radius.circular(radius ?? AppRedius.image),
    );

    Widget? image;
    switch (type) {
      case ImageWidgetType.asset:
        image = ExtendedImage.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
      break;

      case ImageWidgetType.network:
        if(!url.contains('http')) break;
        image = ExtendedImage.network(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
      break;

      case ImageWidgetType.file:
        image = ExtendedImage.file(
          File(url),
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
      break;
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: image ?? _placeholder,
    );
  }

  Widget _buildLoadState(BuildContext context, ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      // 正在读取
      case LoadState.loading:
        return _placeholder;
      //break;

      // 读取成功
      case LoadState.completed:
        Size? size;
        if (state.extendedImageInfo != null) {
          size = Size(
            state.extendedImageInfo!.image.width.toDouble(),
            state.extendedImageInfo!.image.height.toDouble(),
          );
        }
        final provider = state.imageProvider;
        final completed = state.completedWidget;
        return builder?.call(context, provider, completed, size) ?? completed;
      //break;

      // 读取失败
      case LoadState.failed:
        return const Center(
          child: Icon(
            CupertinoIcons.info_circle,
            size: 20,
            color: Colors.grey,
          ),
        );
      //end
    }
  }
}
