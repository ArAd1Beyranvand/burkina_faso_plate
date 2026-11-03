import 'package:flutter/widgets.dart';
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'burkina_faso_country.dart';
import 'burkina_faso_themes.dart';

/// Ink placement in plate units. The article gives no size; each reference
/// photograph is flattened to 520×110 (the 4.7 aspect of the two confident
/// fits) and projected onto each axis. Centres are of measured ink runs,
/// pitches the mean spacing of those centres.
///
/// Sources: `Kennzeichen-Burkina-Faso` (private, hand-read),
/// `Burkina_Faso_Commercial_License_Plate`, `Burkina_Faso_Police_License_Plate`
/// (blurred, so x is approximate) and
/// `Burkina_Faso_Gendarmerie_Staff_Vehicle_license_plate`. The commercial
/// roundel and "BF" sit as on the private plate.
///
/// Reference ink is ~85 tall on a 110 plate; reproducing it would need a
/// ~155-unit box, so the box is capped at [box] and the ink lands near 60% of
/// the photos'. The police emblem and gendarmerie crest are left blank: no
/// vector of either is published.
abstract final class _Layout {
  static const double width = 520, height = 110, box = 100;

  static const double privateCy = 56.7, commercialCy = 55.3, policeCy = 59;
  static const double gendarmerieCy = 53.9;

  static const PlateBox bf = PlateBox(461, 66, 40, 20);

  static const PlateBox roundel = PlateBox(465, 19.5, 41, 41.5);
  static const double bfGlyph = 36;

  /// Capped at 55 so the two letters stay inside x 440–484.
  static const PlateBox policeBf = PlateBox(442, 45, 40, 38);
  static const double policeBfGlyph = 55;

  static const PlateBox dot = PlateBox(246, 46, 13, 16);
  static const double dotGlyph = 16;
}

/// A run keyed `key`: `count` glyphs of `alphabet`, the first centred on
/// `cx`, stepping `pitch`.
typedef _Run = (
  String key,
  PlateAlphabet alphabet,
  int count,
  double cx,
  double pitch,
);

/// Burkina Faso's current plates: one row of characters on a plain field.
///
/// Groups: [private] `region`, `letters`, `serial`; [commercial] `region`,
/// `letter`, `serial`; [police] `service`, `serial`; [gendarmerie] `unit`,
/// `serial`, `corps`. Pair each with the [BurkinaFasoThemes] member of the
/// same name.
///
/// Not implemented: the pre-1995 plates.
abstract final class BurkinaFasoPlates {
  static final PlateSpec private = _spec(
    'bf.private',
    _Layout.privateCy,
    const <_Run>[
      ('region', BurkinaFasoAlphabets.digits, 2, 32.4, 44.6),
      ('letters', BurkinaFasoAlphabets.letters, 2, 158.4, 41),
      ('serial', BurkinaFasoAlphabets.digits, 4, 283, 39.3),
    ],
    labels: _bf,
    decals: <PlateDecal>[_roundel],
  );

  static final PlateSpec commercial = _spec(
    'bf.commercial',
    _Layout.commercialCy,
    const <_Run>[
      ('region', BurkinaFasoAlphabets.digits, 2, 64.5, 44.5),
      ('letter', BurkinaFasoAlphabets.letters, 1, 187.7, 44),
      ('serial', BurkinaFasoAlphabets.digits, 4, 264.5, 45.8),
    ],
    labels: _bf,
    decals: <PlateDecal>[_roundelWhite],
  );

  static final PlateSpec police = _spec(
    'bf.police',
    _Layout.policeCy,
    const <_Run>[
      ('service', BurkinaFasoAlphabets.letters, 2, 97.6, 53.4),
      ('serial', BurkinaFasoAlphabets.digits, 4, 234, 50.4),
    ],
    labels: const <PlateLabel>[
      PlateLabel(
        text: 'BF',
        box: _Layout.policeBf,
        glyphHeight: _Layout.policeBfGlyph,
      ),
    ],
  );

  static final PlateSpec gendarmerie = _spec(
    'bf.gendarmerie',
    _Layout.gendarmerieCy,
    const <_Run>[
      ('unit', BurkinaFasoAlphabets.digits, 1, 33.3, 44),
      ('serial', BurkinaFasoAlphabets.digits, 4, 94.7, 44),
      ('corps', BurkinaFasoAlphabets.letters, 4, 360.4, 41.5),
    ],
    labels: const <PlateLabel>[
      PlateLabel(text: '•', box: _Layout.dot, glyphHeight: _Layout.dotGlyph),
    ],
  );

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    commercial,
    police,
    gendarmerie,
  ];

  /// Flag map in a ring, from `assets/icons/burkina_faso_flag_map.svg`; the
  /// commercial plate uses a white silhouette.
  static const PlateDecal _roundel = PlateDecal(
    image: AssetImage(
      'assets/icons/burkina_faso_roundel.png',
      package: 'burkina_faso_plate',
    ),
    box: _Layout.roundel,
  );

  static const PlateDecal _roundelWhite = PlateDecal(
    image: AssetImage(
      'assets/icons/burkina_faso_roundel_white.png',
      package: 'burkina_faso_plate',
    ),
    box: _Layout.roundel,
  );

  static const List<PlateLabel> _bf = <PlateLabel>[
    PlateLabel(text: 'BF', box: _Layout.bf, glyphHeight: _Layout.bfGlyph),
  ];

  static PlateSpec _spec(
    String id,
    double cy,
    List<_Run> runs, {
    List<PlateLabel> labels = const <PlateLabel>[],
    List<PlateDecal> decals = const <PlateDecal>[],
  }) => PlateSpec(
    id: id,
    country: BurkinaFasoCountry.burkinaFaso,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    slots: <PlateSlot>[
      for (final (String key, PlateAlphabet a, int n, double cx, double p)
          in runs)
        plateRun(
          a,
          n,
          left: cx - p / 2,
          pitch: p,
          top: cy - _Layout.box / 2,
          height: _Layout.box,
          group: key,
        ),
    ],
    labels: labels,
    decals: decals,
  );
}
