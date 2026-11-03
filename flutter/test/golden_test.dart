import 'package:burkina_faso_plate/burkina_faso_plate.dart';
import 'package:plate_core/testing.dart';

void main() {
  plateGoldens('bf', BurkinaFasoCountry.burkinaFaso, <String, PlateGoldenCase>{
    'private': (
      BurkinaFasoPlates.private,
      BurkinaFasoThemes.private,
      '11 GK 1844',
    ),
    'commercial': (
      BurkinaFasoPlates.commercial,
      BurkinaFasoThemes.commercial,
      '11 E 1515',
    ),
    'police': (BurkinaFasoPlates.police, BurkinaFasoThemes.police, 'PN 0020'),
    'gendarmerie': (
      BurkinaFasoPlates.gendarmerie,
      BurkinaFasoThemes.gendarmerie,
      '2 0304 EMGN',
    ),
  });
}
