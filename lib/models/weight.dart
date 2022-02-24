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

  List<Weight> getInstanceList() {
    List<Weight> list = [];
    list.add(Weight(date: '2022.02.02', weight: 52));
    list.add(Weight(date: '2022.02.07', weight: 62));
    list.add(Weight(date: '2022.02.09', weight: 58));
    list.add(Weight(date: '2022.02.13', weight: 72));
    list.add(Weight(date: '2022.02.16', weight: 66));
    return list;
  }
}