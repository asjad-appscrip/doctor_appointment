import 'package:doctor_appointment/res/res.dart';
import 'package:flutter/material.dart';

/// [CustomButton] widget is a custom Button.
///
/// `width` is the width of [CustomButton].
///
/// `height` is the height of [CustomButton].
///
/// `onPress` is the callback when the [CustomButton] is pressed.
///
/// `buttonType` is to define if the button is `active` or `cancelled`.
///
/// `title` is the title of the button.
///
/// `borderWidth` is the border width of the button.
///
/// `titleWidget` is the custom widget for tilte. if `titleWidget` is null `title` will be used.
///
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.onPress,
    this.title,
    this.color,
    this.textColor,
    this.borderColor,
    this.padding,
    this.borderWidth,
    this.titleWidget,
    this.isDisable = false,
    this.margin,
    this.height,
    this.textAlign,
    this.radius,
    this.elevation,
  }) : super(key: key);

  final String? title;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function()? onPress;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? titleWidget;
  final bool isDisable;
  final TextAlign? textAlign;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(
      Radius.circular(
        radius ?? Dimens.thirtyTwo,
      ),
    );
    return Container(
      margin: margin,
      height: height ?? Dimens.fiftySix,
      constraints: BoxConstraints(
        maxHeight: Dimens.fiftySix,
      ),
      child: Material(
        elevation: elevation ?? Dimens.zero,
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisable
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (onPress != null) {
                    onPress!();
                  }
                },
          splashColor: isDisable ? null : Colors.black.withOpacity(0.6),
          borderRadius: borderRadius,
          child: Ink(
            width: width ?? double.infinity,
            padding: padding ?? Dimens.edgeInsetsAll(Dimens.zero),
            decoration: BoxDecoration(
              color: isDisable
                  ? Colors.white.withOpacity(.5)
                  : color ?? Colors.white,
              borderRadius: borderRadius,
              border: Border.all(
                width: borderWidth ?? 0,
                color: isDisable
                    ? Colors.white.withOpacity(.5)
                    : borderColor ?? color ?? Colors.white,
              ),
            ),
            child: titleWidget ??
                Center(
                  child: Text(
                    '$title',
                    style: color != null
                        ? textColor != null
                            ? Styles.whiteBold16.copyWith(color: textColor)
                            : Styles.whiteBold16.copyWith(color: Colors.white)
                        : Styles.whiteBold16.copyWith(color: Colors.white),
                    textAlign: textAlign,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
