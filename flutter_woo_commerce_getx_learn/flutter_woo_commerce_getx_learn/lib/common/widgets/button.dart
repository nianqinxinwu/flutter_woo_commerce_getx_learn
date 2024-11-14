import 'package:flutter/material.dart';
import '../index.dart';

enum ButtonWidgetType {
  none, // 无
  primary, // 主要按钮
  secondary, // 次要按钮
  text, // 文本按钮
  icon, // 图标按钮
  textFilled, // 文本/填充按钮
  textRoundFilled, // 文本/圆角填充按钮
  iconTextUpDown, // 图标+文本上下排列按钮
  iconTextOutlined, // 图标+文本描边按钮
  iconTextUpDownOutlined, // 图标+文本上下排列描边按钮
  textIcon, // 文本+图标按钮
  dropdown, // 下拉按钮
}

class ButtonWidget extends StatelessWidget {
  final ButtonWidgetType type;

  /// tap 事件
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 子组件
  final Widget? child;

  /// 图标
  final Widget? icon;

  /// 圆角
  final double? borderRadius;

  /// 背景色
  final Color? backgroundColor;

  /// 边框色
  final Color? borderColor;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  const ButtonWidget(
      {super.key,
      this.type = ButtonWidgetType.none,
      this.onTap,
      this.text,
      this.child,
      this.icon,
      this.borderRadius,
      this.backgroundColor,
      this.borderColor,
      this.width,
      this.height});

  /// 主要
  const ButtonWidget.primary(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.primary,
    this.width = double.infinity,
    this.height = 50,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  });

  /// 次要
  const ButtonWidget.secondary(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.secondary,
    this.width = double.infinity,
    this.height = 50,
    this.onTap,
    this.child,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  });

  /// 文字
  ButtonWidget.text(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.text,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.width,
    this.height,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  }) : child = TextWidget.button(
            text: text!, size: textSize, color: textColor, weight: textWeight);

  /// 图标
  const ButtonWidget.icon(
    this.icon, {
    super.key,
    this.type = ButtonWidgetType.icon,
    this.width,
    this.height,
    this.onTap,
    this.child,
    this.text,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
  });

  /// 文本/填充按钮
  /// 文字/填充
  ButtonWidget.textFilled(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.textFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        );

  /// 文字/填充/圆形 按钮
  ButtonWidget.textRoundFilled(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.textRoundFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        );

  /// 图标文字 上下
  ButtonWidget.iconTextUpDown(
    this.icon,
    this.text, {
    super.key,
    this.type = ButtonWidgetType.iconTextUpDown,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          icon!,
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toColumn(
          mainAxisSize: MainAxisSize.min,
        );

  /// 图标 / 文字 / 边框
  ButtonWidget.iconTextOutlined(
    this.icon,
    this.text, {
    super.key,
    this.type = ButtonWidgetType.iconTextOutlined,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          icon!.paddingRight(AppSpace.iconTextSmail),
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toRow(
          mainAxisSize: MainAxisSize.min,
        );

  /// 图标 / 文字 / 上下 / 边框
  ButtonWidget.iconTextUpDownOutlined(
    this.icon,
    this.text, {
    super.key,
    this.type = ButtonWidgetType.iconTextUpDownOutlined,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          icon!.paddingBottom(AppSpace.iconTextSmail),
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toColumn(
          mainAxisSize: MainAxisSize.min,
        );

  /// 文字 / 图标
  ButtonWidget.textIcon(
    this.text,
    this.icon, {
    super.key,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.type = ButtonWidgetType.textIcon,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ).paddingRight(AppSpace.iconTextSmail),
          icon!,
        ].toRow(
          mainAxisSize: MainAxisSize.min,
        );

  /// 文字 / 图标 / dropdown
  ButtonWidget.dropdown(
    this.text,
    this.icon, {
    super.key,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.type = ButtonWidgetType.dropdown,
    this.onTap,
    this.borderRadius = 0,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ).expanded(),
          icon!,
        ]
            .toRow(
              mainAxisSize: MainAxisSize.min,
            )
            .paddingHorizontal(AppSpace.button);

  // 背景色
  WidgetStateProperty<Color?>? get _backgroundColor {
    switch (type) {
      case ButtonWidgetType.primary:
        return WidgetStateProperty.all(
          backgroundColor ?? AppColors.primary,
        );
      // break;

      default:
        return WidgetStateProperty.all(backgroundColor ?? Colors.transparent);
    }
  }

  // 边框
  WidgetStateProperty<BorderSide?>? get _side {
    switch (type) {
      case ButtonWidgetType.secondary:
        return WidgetStateProperty.all(
          BorderSide(
            color: borderColor ?? AppColors.secondary,
            width: 1,
          ),
        );
      // break;

      case ButtonWidgetType.iconTextOutlined:
      case ButtonWidgetType.iconTextUpDownOutlined:
      case ButtonWidgetType.dropdown:
        return WidgetStateProperty.all(
          BorderSide(
            color: borderColor ?? AppColors.outline,
            width: 1,
          ),
        );
      // break;

      default:
        return null;
    }
  }

  // 阴影
  WidgetStateProperty<Color?>? get _overlayColor {
    switch (type) {
      case ButtonWidgetType.primary:
        return null;
      default:
        return WidgetStateProperty.all(AppColors.surfaceVariant);
    }
  }

  // 形状圆角
  WidgetStateProperty<OutlinedBorder?>? get _shpe {
    switch (type) {
      case ButtonWidgetType.primary:
      case ButtonWidgetType.secondary:
        return WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRedius.button)),
          ),
        );
      // break;

      case ButtonWidgetType.textFilled:
      case ButtonWidgetType.iconTextOutlined:
      case ButtonWidgetType.iconTextUpDownOutlined:
        return WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRedius.buttonTextFilled)),
          ),
        );
      // break;
      case ButtonWidgetType.dropdown:
      case ButtonWidgetType.textRoundFilled:
        return WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          ),
        );
      // break;

      default:
        return null;
    }
  }

  // padding
  WidgetStateProperty<EdgeInsetsGeometry>? get _padding {
    switch (type) {
      default:
        return WidgetStateProperty.all(const EdgeInsets.all(0));
    }
  }

  // 子元素
  Widget? get _child {
    switch (type) {
      case ButtonWidgetType.primary:
        return TextWidget.button(
          text: text!,
          color: AppColors.onPrimary,
        );

      case ButtonWidgetType.secondary:
        return TextWidget.button(
          text: text!,
          color: AppColors.primary,
        );

      case ButtonWidgetType.icon:
        return icon;

      default:
        return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
          elevation: WidgetStateProperty.all(0),
          backgroundColor: _backgroundColor,
          overlayColor: _overlayColor,
          shape: _shpe,
          padding: _padding,
          side: _side,
        ),
        onPressed: onTap,
        child: _child,
      ),
    );
  }
}
