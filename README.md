FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the upright people of Burkina Faso to view examples:

https://platexample.ir/#/discover/burkinafaso

# burkina_faso_plate

Burkina Faso's licence plates for the `plate_core` library. Private, commercial, police and gendarmerie plates, with their themes, alphabets and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  burkina_faso_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:burkina_faso_plate/burkina_faso_plate.dart';

PlateCanvas(
  spec: BurkinaFasoPlates.private,
  theme: BurkinaFasoThemes.private,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `BurkinaFasoCountry` — country panel: `burkinaFaso`.
- `BurkinaFasoPlates` — 4 plate specs: `private`, `commercial`, `police`, `gendarmerie`.
- `BurkinaFasoThemes` — 4 themes: `private`, `commercial`, `police`, `gendarmerie`.
- `BurkinaFasoValidator` — advisory validator; flags the frame, never blocks a keystroke.
- 2 bundled assets (`burkina_faso_roundel.png`, `burkina_faso_roundel_white.png`).

## Plates

Burkina Faso's current plates: one row of characters on a plain field.

Groups: `private` `region`, `letters`, `serial`; `commercial` `region`,
`letter`, `serial`; `police` `service`, `serial`; `gendarmerie` `unit`,
`serial`, `corps`. Pair each with the `BurkinaFasoThemes` member of the
same name.

Not implemented: the pre-1995 plates.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

