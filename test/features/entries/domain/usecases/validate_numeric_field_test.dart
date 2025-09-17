import 'package:flutter_test/flutter_test.dart';
import 'package:tea_challenge/features/entries/domain/usecases/validate_numeric_field.dart';

void main() {
  group('ValidateNumericField', () {
    late ValidateNumericField validator;

    setUp(() {
      validator = ValidateNumericField();
    });

    group('call method - validates decimal numbers', () {
      test('should return valid for valid whole numbers', () {
        expect(validator('123'), equals(NumericValidationResult.valid));
        expect(validator('0'), equals(NumericValidationResult.valid));
        expect(validator('999'), equals(NumericValidationResult.valid));
      });

      test('should return valid for valid decimal numbers', () {
        expect(validator('123.45'), equals(NumericValidationResult.valid));
        expect(validator('0.5'), equals(NumericValidationResult.valid));
        expect(validator('999.99'), equals(NumericValidationResult.valid));
        expect(validator('123.4'), equals(NumericValidationResult.valid));
      });

      test('should return appropriate error for invalid inputs', () {
        expect(validator(''), equals(NumericValidationResult.empty));
        expect(validator(null), equals(NumericValidationResult.empty));
        expect(validator('abc'), equals(NumericValidationResult.containsLetters));
        expect(validator('12.345'), equals(NumericValidationResult.tooManyDecimals));
        expect(validator('12.3.4'), equals(NumericValidationResult.invalidFormat));
        expect(validator('-123'), equals(NumericValidationResult.containsSpecialChars));
        expect(validator('+123'), equals(NumericValidationResult.containsSpecialChars));
        expect(validator('12 34'), equals(NumericValidationResult.containsSpecialChars));
        expect(validator('12,34'), equals(NumericValidationResult.containsSpecialChars));
      });
    });
  });
}
