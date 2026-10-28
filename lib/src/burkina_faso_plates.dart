import 'dart:math';

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
  static const double width = 520, height = 110;
  static const double box = 100;

  static const double privateCy = 56.7;
  static const double commercialCy = 55.3;
  static const double policeCy = 59;
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

/// [count] same-kind slots from [cx] at [pitch], keyed [key].
class _Run {
  const _Run(this.key, this.alphabet, this.count, this.cx, this.pitch);

  final String key;
  final PlateAlphabet alphabet;
  final int count;
  final double cx;
  final double pitch;
}

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
      _Run('region', BurkinaFasoAlphabets.digits, 2, 32.4, 44.6),
      _Run('letters', BurkinaFasoAlphabets.letters, 2, 158.4, 41),
      _Run('serial', BurkinaFasoAlphabets.digits, 4, 283, 39.3),
    ],
    labels: _bf,
    decals: <PlateDecal>[_roundel],
  );

  static final PlateSpec commercial = _spec(
    'bf.commercial',
    _Layout.commercialCy,
    const <_Run>[
      _Run('region', BurkinaFasoAlphabets.digits, 2, 64.5, 44.5),
      _Run('letter', BurkinaFasoAlphabets.letters, 1, 187.7, 44),
      _Run('serial', BurkinaFasoAlphabets.digits, 4, 264.5, 45.8),
    ],
    labels: _bf,
    decals: <PlateDecal>[_roundelWhite],
  );

  static final PlateSpec police = _spec(
    'bf.police',
    _Layout.policeCy,
    const <_Run>[
      _Run('service', BurkinaFasoAlphabets.letters, 2, 97.6, 53.4),
      _Run('serial', BurkinaFasoAlphabets.digits, 4, 234, 50.4),
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
      _Run('unit', BurkinaFasoAlphabets.digits, 1, 33.3, 44),
      _Run('serial', BurkinaFasoAlphabets.digits, 4, 94.7, 44),
      _Run('corps', BurkinaFasoAlphabets.letters, 4, 360.4, 41.5),
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
  }) {
    final List<PlateSlot> slots = <PlateSlot>[];
    final List<PlateTextGroup> groups = <PlateTextGroup>[];
    for (final _Run r in runs) {
      groups.add(PlateTextGroup(<int>[slots.length], key: r.key));
      slots.add(
        PlateSlot(
          alphabet: r.alphabet,
          box: PlateBox(
            r.cx - r.pitch / 2,
            cy - _Layout.box / 2,
            r.count * r.pitch,
            _Layout.box,
          ),
          length: r.count,
          spacing: max(0, r.pitch - 0.6 * 0.72 * _Layout.box),
        ),
      );
    }
    return PlateSpec(
      id: id,
      country: BurkinaFasoCountry.burkinaFaso,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: true,
      slots: slots,
      labels: labels,
      decals: decals,
      textGroups: groups,
    );
  }
}
