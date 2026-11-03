FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the upright people of Burkina Faso to view examples:

https://platexample.ir/#/discover/burkinafaso:flutter

# burkina_faso_plate

Burkina Faso's licence plates for plate_core: private (black on white), commercial (white on blue), police and gendarmerie (white on black), with their themes, and more.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/burkina_faso_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/burkinafaso:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/burkina_faso_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/burkinafaso:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/burkina_faso_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/burkinafaso:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/burkina_faso_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/burkinafaso:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  burkina_faso_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:burkina_faso_plate/burkina_faso_plate.dart';

PlateCanvas(
  spec: BurkinaFasoPlates.private,
  theme: BurkinaFasoThemes.private,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `BurkinaFasoPlates.private`
- `BurkinaFasoPlates.commercial`
- `BurkinaFasoPlates.police`
- `BurkinaFasoPlates.gendarmerie`

## Themes

- `BurkinaFasoThemes.private`
- `BurkinaFasoThemes.commercial`
- `BurkinaFasoThemes.police`
- `BurkinaFasoThemes.gendarmerie`

## Change it

`PlateCanvas` takes `spec:` (an entry of `BurkinaFasoPlates`) and `theme:` (an entry of `BurkinaFasoThemes`). Set `validator:` to `BurkinaFasoValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `BurkinaFasoCountry` — the country panel.
- `BurkinaFasoValidator` — the plate validator.

## Plates

Burkina Faso's current plates: one row of characters on a plain field.

Groups: `private` `region`, `letters`, `serial`; `commercial` `region`,
`letter`, `serial`; `police` `service`, `serial`; `gendarmerie` `unit`,
`serial`, `corps`. Pair each with the `BurkinaFasoThemes` member of the
same name.

Not implemented: the pre-1995 plates.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/burkina_faso_plate/blob/main/LICENSE).
