class Obj_Settlement{
  final DateTime date;
  final String settlement;
  final String settlementDescription;
  final bool budget;
  final bool urgency;
  final double units;
  late double price;
  DateTime? date_modify;

  Obj_Settlement({
    required this.date,
  required this.settlement,
  required this.settlementDescription,
  required this.budget,
  required this.urgency,
  required this.units,
  required this.price,
  });
}