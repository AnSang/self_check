class Weight {
  final String date;
  final double weight;

  Weight({
    required this.date,
    required this.weight
  });

  Weight.fromJson(Map<String, Object?> json)
      : this(
    date: json['date']! as String,
    weight: json['weight']! as double
  );

  Map<String, dynamic> toJson() {
    return {
      'date' : date,
      'weight' : weight
    };
  }

  @override
  String toString() {
    return '"weight" : { "date": $date, "weight": $weight}';
  }
}

class WeightList {
  final List<Weight> weights;

  WeightList({ required this.weights });
}