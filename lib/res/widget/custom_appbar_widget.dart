import 'package:doctor_appointment/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    Key? key,
    this.title = '',
    this.centerTitle = true,
    this.leading,
    this.textStyle,
    this.actions,
    this.isUserThere = false,
    this.onTap,
    this.automaticallyImplyLeading = true,
    this.iconThemeData,
    this.shape,
    this.titleStyle,
    this.leadingWidth,
    this.titleSize,
    this.backgroungColor,
    this.onTapleading,
    this.isPresenter = false,
    this.titleWidget,
    this.isStatusBarDark = false,
    this.appBarHeight,
    this.systemOverlayStyle,
    this.showDivider = false,
  }) : super(key: key);

  final String? title;
  final double? titleSize;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final bool isStatusBarDark;
  final Widget? leading;
  final Widget? titleWidget;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final bool isUserThere;
  final bool isPresenter;
  final VoidCallback? onTap;
  final VoidCallback? onTapleading;
  final bool automaticallyImplyLeading;
  final IconThemeData? iconThemeData;
  final double? leadingWidth;
  final ShapeBorder? shape;
  final Color? backgroungColor;
  final double? appBarHeight;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool? showDivider;

  @override
  Size get preferredSize => Size(
        Dimens.percentWidth(1),
        appBarHeight ?? Dimens.sixtySeven,
      );

  @override
  Widget build(BuildContext context) => Container(
        color: backgroungColor ?? Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: AppBar(
            systemOverlayStyle: systemOverlayStyle ??
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark,
                ),
            backgroundColor: backgroungColor ?? Colors.white,
            toolbarHeight: preferredSize.height,
            automaticallyImplyLeading: false,
            shape: shape,
            centerTitle: centerTitle ? centerTitle : null,
            title: titleWidget ??
                InkWell(
                  onTap: onTap,
                  child: Text(
                    title ?? '',
                    style: titleStyle ??
                        (titleSize == null
                            ? Styles.black16
                            : Styles.black16.copyWith(fontSize: titleSize)),
                  ),
                ),
            titleSpacing: Dimens.zero,
            leadingWidth: leadingWidth ?? Dimens.sixty,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UnconstrainedBox(
                  child: InkWell(
                    onTap: onTapleading ?? Get.back,
                    child: Container(
                      padding: Dimens.edgeInsetsAll(Dimens.five),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12)),
                      child: leading ??
                          Icon(
                            Icons.arrow_back,
                            size: Dimens.thirty,
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            actions: actions,
            elevation: 0,
            bottom: showDivider == true
                ? PreferredSize(
                    preferredSize: Size(
                      Dimens.percentWidth(1),
                      Dimens.one,
                    ),
                    child: const Divider(),
                  )
                : null,
          ),
        ),
      );
}
