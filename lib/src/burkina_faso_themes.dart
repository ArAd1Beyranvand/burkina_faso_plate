import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'burkina_faso_colors.dart';

/// One ink on one field, the frame in the ink.
///
/// The photos show no frame line, so the border is a thin 0.02 of the height
/// and the corners round at 0.04; neither is measured.
abstract final class BurkinaFasoThemes {
  /// Private plate: black on white.
  static final PlateTheme private = _ink(
    BurkinaFasoColors.white,
    BurkinaFasoColors.black,
  );

  /// Commercial plate: white on blue.
  static final PlateTheme commercial = _ink(
    BurkinaFasoColors.blue,
    BurkinaFasoColors.blueInk,
  );

  /// National Police plate: white on a blue-black.
  static final PlateTheme police = _ink(
    BurkinaFasoColors.police,
    BurkinaFasoColors.policeInk,
  );

  /// National Gendarmerie plate: white on black.
  static final PlateTheme gendarmerie = _ink(
    BurkinaFasoColors.gendarmerie,
    BurkinaFasoColors.gendarmerieInk,
  );
}

PlateTheme _ink(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: BurkinaFasoColors.inactive,
  borderWidthRatio: 0.02,
  plateRadiusRatio: 0.04,
);
