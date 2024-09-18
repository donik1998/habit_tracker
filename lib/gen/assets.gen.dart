/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Inter-Bold.ttf
  String get interBold => 'assets/fonts/Inter-Bold.ttf';

  /// File path: assets/fonts/Inter-Light.ttf
  String get interLight => 'assets/fonts/Inter-Light.ttf';

  /// File path: assets/fonts/Inter-Medium.ttf
  String get interMedium => 'assets/fonts/Inter-Medium.ttf';

  /// File path: assets/fonts/Inter-Regular.ttf
  String get interRegular => 'assets/fonts/Inter-Regular.ttf';

  /// List of all assets
  List<String> get values => [interBold, interLight, interMedium, interRegular];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/png/app_icon.png');

  /// File path: assets/png/mountains_back.jpg
  AssetGenImage get mountainsBack => const AssetGenImage('assets/png/mountains_back.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [appIcon, mountainsBack];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/award.svg
  SvgGenImage get award => const SvgGenImage('assets/svg/award.svg');

  /// File path: assets/svg/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/svg/calendar.svg');

  /// File path: assets/svg/challenge_tab.svg
  SvgGenImage get challengeTab => const SvgGenImage('assets/svg/challenge_tab.svg');

  /// File path: assets/svg/check.svg
  SvgGenImage get check => const SvgGenImage('assets/svg/check.svg');

  /// File path: assets/svg/close.svg
  SvgGenImage get close => const SvgGenImage('assets/svg/close.svg');

  /// File path: assets/svg/code-browser.svg
  SvgGenImage get codeBrowser => const SvgGenImage('assets/svg/code-browser.svg');

  /// File path: assets/svg/cross.svg
  SvgGenImage get cross => const SvgGenImage('assets/svg/cross.svg');

  /// File path: assets/svg/directions_run.svg
  SvgGenImage get directionsRun => const SvgGenImage('assets/svg/directions_run.svg');

  /// File path: assets/svg/directions_run_small.svg
  SvgGenImage get directionsRunSmall => const SvgGenImage('assets/svg/directions_run_small.svg');

  /// File path: assets/svg/goals_tab.svg
  SvgGenImage get goalsTab => const SvgGenImage('assets/svg/goals_tab.svg');

  /// File path: assets/svg/habits_tab.svg
  SvgGenImage get habitsTab => const SvgGenImage('assets/svg/habits_tab.svg');

  /// File path: assets/svg/information.svg
  SvgGenImage get information => const SvgGenImage('assets/svg/information.svg');

  /// File path: assets/svg/information_outlined.svg
  SvgGenImage get informationOutlined => const SvgGenImage('assets/svg/information_outlined.svg');

  /// File path: assets/svg/invisible.svg
  SvgGenImage get invisible => const SvgGenImage('assets/svg/invisible.svg');

  /// File path: assets/svg/lightning.svg
  SvgGenImage get lightning => const SvgGenImage('assets/svg/lightning.svg');

  /// File path: assets/svg/logo_colored.svg
  SvgGenImage get logoColored => const SvgGenImage('assets/svg/logo_colored.svg');

  /// File path: assets/svg/logo_white.svg
  SvgGenImage get logoWhite => const SvgGenImage('assets/svg/logo_white.svg');

  /// File path: assets/svg/notification_bell.svg
  SvgGenImage get notificationBell => const SvgGenImage('assets/svg/notification_bell.svg');

  /// File path: assets/svg/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/svg/plus.svg');

  /// File path: assets/svg/profile_tab.svg
  SvgGenImage get profileTab => const SvgGenImage('assets/svg/profile_tab.svg');

  /// File path: assets/svg/radio_button_selected.svg
  SvgGenImage get radioButtonSelected => const SvgGenImage('assets/svg/radio_button_selected.svg');

  /// File path: assets/svg/radio_button_unselected.svg
  SvgGenImage get radioButtonUnselected => const SvgGenImage('assets/svg/radio_button_unselected.svg');

  /// File path: assets/svg/rocket.svg
  SvgGenImage get rocket => const SvgGenImage('assets/svg/rocket.svg');

  /// File path: assets/svg/splash_logo.svg
  SvgGenImage get splashLogo => const SvgGenImage('assets/svg/splash_logo.svg');

  /// File path: assets/svg/visible.svg
  SvgGenImage get visible => const SvgGenImage('assets/svg/visible.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        award,
        calendar,
        challengeTab,
        check,
        close,
        codeBrowser,
        cross,
        directionsRun,
        directionsRunSmall,
        goalsTab,
        habitsTab,
        information,
        informationOutlined,
        invisible,
        lightning,
        logoColored,
        logoWhite,
        notificationBell,
        plus,
        profileTab,
        radioButtonSelected,
        radioButtonUnselected,
        rocket,
        splashLogo,
        visible
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/ru.json
  String get ru => 'assets/translations/ru.json';

  /// File path: assets/translations/uz.json
  String get uz => 'assets/translations/uz.json';

  /// List of all assets
  List<String> get values => [en, ru, uz];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
