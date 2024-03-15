import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  // spp bar title
  TextStyle? get display => Theme.of(this).textTheme.displayLarge;
  // sub display
  TextStyle? get subDisplay => Theme.of(this).textTheme.displaySmall;
  // heading
  TextStyle? get heading => Theme.of(this).textTheme.headlineLarge;
  // sub heading
  TextStyle? get subHeading => Theme.of(this).textTheme.headlineSmall;
  // title
  TextStyle? get title => Theme.of(this).textTheme.titleLarge;
  // sub title
  TextStyle? get subTitle => Theme.of(this).textTheme.titleMedium;
  // body
  TextStyle? get body => Theme.of(this).textTheme.titleSmall;
  // description
  TextStyle? get description => Theme.of(this).textTheme.bodyLarge;
  // description
  TextStyle? get smallDescription => Theme.of(this).textTheme.bodySmall;
  // placeholder
  TextStyle? get placeholder => Theme.of(this).textTheme.labelLarge;
  // button
  TextStyle? get button => Theme.of(this).textTheme.labelMedium;
  // button
  TextStyle? get smallButton =>
      Theme.of(this).textTheme.labelMedium?.copyWith(fontSize: 12);
  // text button
  TextStyle? get textButton => Theme.of(this).textTheme.labelSmall;

  // Custom text style
  // card title
  TextStyle? get cardTitle =>
      Theme.of(this).textTheme.titleLarge?.apply(color: Colors.white);
  // card sub title
  TextStyle? get cardSubTitle =>
      Theme.of(this).textTheme.titleMedium?.apply(color: Colors.white);
}
