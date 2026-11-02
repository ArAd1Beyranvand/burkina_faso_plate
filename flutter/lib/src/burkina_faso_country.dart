import 'package:plate_core/plate_core.dart';

import 'burkina_faso_colors.dart';

/// The plates have no country block (the "BF" is a label), so every spec sets
/// `noPanel`.
abstract final class BurkinaFasoCountry {
  static const PlateCountry burkinaFaso = PlateCountry(
    code: 'bf',
    captionLines: <String>[],
    panelColor: BurkinaFasoColors.white,
    panelTextColor: BurkinaFasoColors.black,
  );
}
