
/// 转换
class Convert {
  // 阿里图片尺寸调整
  static String aliImageResize(
    String url, {
      double width = 300,
      double? maxHeight,
    }) {
      var crop = '';
      int width0 = width.toInt();
      int? maxHeight0 = maxHeight?.toInt();

      if (maxHeight != null) {
        crop = '/crop,h_$maxHeight0,g_center';
      }
      return '$url?X-oss-process=image/resize,w_$width0,m_lfit$crop';
  }
}
