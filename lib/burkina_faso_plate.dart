/// Burkina Faso's licence plates for the `plate_core` library.
///
/// Private, commercial, police and gendarmerie plates, with their themes,
/// alphabets and an advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.burkina_faso`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/burkina_faso`; tree-shakable.
// TODO(kt): [D5] package `countries.burkina_faso` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show BurkinaFasoAlphabets;
export 'src/burkina_faso_colors.dart';
export 'src/burkina_faso_country.dart';
export 'src/burkina_faso_plates.dart';
export 'src/burkina_faso_themes.dart';
export 'src/burkina_faso_validators.dart';
