import 'package:plate_core/plate_core.dart';

/// Judges a Burkinabè plate against its category's format. Reports, never
/// bars a keystroke.
///
/// - private: `12 AB 1234` — two digits, two letters, four digits;
/// - commercial: `12 A 1234` — two digits, one letter, four digits;
/// - police: `PN 1234` — two letters, four digits;
/// - gendarmerie: `1 2345 EMGN` — one digit, four digits, four letters.
class BurkinaFasoValidator extends GatedPlateValidator {
  const BurkinaFasoValidator.private()
    : _rules = const <(String, bool, int)>[
        ('region', true, 2),
        ('letters', false, 2),
        ('serial', true, 4),
      ];

  const BurkinaFasoValidator.commercial()
    : _rules = const <(String, bool, int)>[
        ('region', true, 2),
        ('letter', false, 1),
        ('serial', true, 4),
      ];

  const BurkinaFasoValidator.police()
    : _rules = const <(String, bool, int)>[
        ('service', false, 2),
        ('serial', true, 4),
      ];

  const BurkinaFasoValidator.gendarmerie()
    : _rules = const <(String, bool, int)>[
        ('unit', true, 1),
        ('serial', true, 4),
        ('corps', false, 4),
      ];

  /// (group, digits rather than letters, length), in plate order.
  final List<(String, bool, int)> _rules;

  @override
  String get gateGroup => 'serial';

  @override
  PlateValidation judge(PlateEntry entry) {
    for (final (String group, bool digits, int length) in _rules) {
      final String value = entry.group(group);
      final bool ok = digits
          ? isDigitsOfLength(value, length)
          : RegExp('^[A-Z]{$length}\$').hasMatch(value);
      if (!ok) {
        return PlateValidation.invalid(
          'The $group is $length ${digits ? 'digit' : 'letter'}'
          '${length == 1 ? '' : 's'}.',
        );
      }
    }
    return const PlateValidation.valid();
  }
}
