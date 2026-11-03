import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:burkina_faso_plate/burkina_faso_plate.dart';

void main() => runApp(
  PlateExampleApp(
    spec: BurkinaFasoPlates.private,
    theme: BurkinaFasoThemes.private,
  ),
);
