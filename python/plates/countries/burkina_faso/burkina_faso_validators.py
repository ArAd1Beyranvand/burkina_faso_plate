"""Port of burkina_faso_plate/lib/src/burkina_faso_validators.dart."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length

# (group, digits rather than letters, length), in plate order; the spec's group keys tell the category.
_RULES = {
    "letters": (("region", True, 2), ("letters", False, 2), ("serial", True, 4)),
    "letter": (("region", True, 2), ("letter", False, 1), ("serial", True, 4)),
    "service": (("service", False, 2), ("serial", True, 4)),
    "unit": (("unit", True, 1), ("serial", True, 4), ("corps", False, 4)),
}


class BurkinaFasoValidator(GatedPlateValidator):
    gate_group = "serial"

    def judge(self, entry: PlateEntry) -> PlateValidation:
        keys = {g.key for g in entry.spec.text_groups}
        rules = next((r for k, r in _RULES.items() if k in keys), ())
        for group, digits, length in rules:
            value = entry.group(group)
            ok = is_digits_of_length(value, length) if digits else re.fullmatch(f"[A-Z]{{{length}}}", value) is not None
            if not ok:
                return PlateValidation.invalid(
                    f"The {group} is {length} {'digit' if digits else 'letter'}{'' if length == 1 else 's'}.")
        return PlateValidation.valid()
