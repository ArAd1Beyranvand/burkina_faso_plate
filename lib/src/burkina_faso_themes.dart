import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'burkina_faso_colors.dart';

/// One ink on one field. The photos show no frame line; border and corner
/// ratios are unmeasured.
abstract final class BurkinaFasoThemes {
  static final PlateTheme private = _ink(BurkinaFasoColors.white, BurkinaFasoColors.black);

  static final PlateTheme commercial = _ink(BurkinaFasoColors.blue, BurkinaFasoColors.blueInk);

  static final PlateTheme police = _ink(BurkinaFasoColors.police, BurkinaFasoColors.policeInk);

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
