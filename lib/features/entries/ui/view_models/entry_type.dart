enum EntryType {
  food('food'),
  water('water');

  const EntryType(this.value);
  final String value;

  static EntryType fromString(String value) {
    return EntryType.values.firstWhere((type) => type.value == value, orElse: () => EntryType.food);
  }
}

enum WaterQuantity {
  halfLiter('0.5L', 0.5),
  oneLiter('1L', 1.0),
  oneAndHalfLiter('1.5L', 1.5),
  twoLiters('2L', 2.0),
  twoAndHalfLiters('2.5L', 2.5),
  threeLiters('3L', 3.0),
  custom('Custom', 0.0);

  const WaterQuantity(this.label, this.amountInLiters);
  final String label;
  final double amountInLiters;

  static WaterQuantity fromString(String value) {
    return WaterQuantity.values.firstWhere((quantity) => quantity.label == value, orElse: () => WaterQuantity.halfLiter);
  }
}
