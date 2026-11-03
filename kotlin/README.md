FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the upright people of Burkina Faso to view examples:

https://platexample.ir/#/discover/burkinafaso:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/burkina_faso/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.burkina_faso.country

val spec = country.specs["bf.private"]
println(country.pkg)
```

## Specs

The specs are the same in every language (they come from shared data).

- `bf.private`
- `bf.commercial`
- `bf.police`
- `bf.gendarmerie`

## Themes

- `BurkinaFasoThemes.private`
- `BurkinaFasoThemes.commercial`
- `BurkinaFasoThemes.police`
- `BurkinaFasoThemes.gendarmerie`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`BurkinaFasoValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/burkina_faso_plate/blob/main/LICENSE).
