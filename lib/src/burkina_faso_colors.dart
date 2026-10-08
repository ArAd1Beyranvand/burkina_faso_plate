import 'package:flutter/widgets.dart';

/// The colours of the Burkinabè plates, one photo each, sampled from the
/// flattened photo and white-balanced against a known white in it.
///
/// The police photo is dark and motion-blurred: its field reads as a very
/// dark blue-black and its ink is dimmed; treat both as approximate.
abstract final class BurkinaFasoColors {
  /// Private field. `Kennzeichen-Burkina-Faso`: `F4F5F4`.
  static const Color white = Color(0xFFF4F5F4);

  /// Its ink, same photo: `45413F` (embossed black, lifted by daylight).
  static const Color black = Color(0xFF45413F);

  /// Commercial field. `Burkina_Faso_Commercial_License_Plate`: `3457B3`.
  static const Color blue = Color(0xFF3457B3);

  /// Its ink, same photo: `F6F7F7`.
  static const Color blueInk = Color(0xFFF6F7F7);

  /// Police field. `Burkina_Faso_Police_License_Plate`: `17131F`.
  static const Color police = Color(0xFF17131F);

  /// Its ink, same photo: `D8D3D1`.
  static const Color policeInk = Color(0xFFD8D3D1);

  /// Gendarmerie field.
  /// `Burkina_Faso_Gendarmerie_Staff_Vehicle_license_plate`: `1E1B19`.
  static const Color gendarmerie = Color(0xFF1E1B19);

  /// Its ink, same photo: `E6E5E3`.
  static const Color gendarmerieInk = Color(0xFFE6E5E3);

  static const Color inactive = Color(0xFFB0B0B0);
}
