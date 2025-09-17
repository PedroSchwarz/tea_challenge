/// Validation result enum for numeric fields
enum NumericValidationResult { valid, empty, invalidFormat, tooManyDecimals, containsLetters, containsSpecialChars }

/// Use case for validating numeric fields in entry forms
class ValidateNumericField {
  /// Validates that a field contains only digits (with optional decimal places)
  ///
  /// Supports:
  /// - Whole numbers: "123"
  /// - Decimal numbers: "123.45"
  /// - Numbers with up to 2 decimal places: "123.4" or "123.45"
  ///
  /// Returns NumericValidationResult enum
  NumericValidationResult call(String? value) {
    if (value == null || value.isEmpty) {
      return NumericValidationResult.empty;
    }

    // Check for letters
    if (RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return NumericValidationResult.containsLetters;
    }

    // Check for special characters (except decimal point)
    if (RegExp(r'[^0-9.]').hasMatch(value)) {
      return NumericValidationResult.containsSpecialChars;
    }

    // Check for multiple decimal points
    if (value.split('.').length > 2) {
      return NumericValidationResult.invalidFormat;
    }

    // Check for more than 2 decimal places
    if (value.contains('.')) {
      final parts = value.split('.');
      if (parts.length == 2 && parts[1].length > 2) {
        return NumericValidationResult.tooManyDecimals;
      }
    }

    // Check if it's a valid number format
    final regex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!regex.hasMatch(value)) {
      return NumericValidationResult.invalidFormat;
    }

    return NumericValidationResult.valid;
  }
}
