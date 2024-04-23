import 'dart:convert';

class SpecialHours {
  final int id;
  String fromDate;
  String toDate;
  String fromTime;
  String toTime;
  bool isEditable = false;

  SpecialHours({
    required this.id,
    required this.fromDate,
    required this.toDate,
    required this.fromTime,
    required this.toTime,
    this.isEditable = false,
  });

  SpecialHours copyWith({
    int? id,
    String? fromDate,
    String? toDate,
    String? fromTime,
    String? toTime,
  }) {
    return SpecialHours(
      id: id ?? this.id,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fromDate': fromDate,
      'toDate': toDate,
      'fromTime': fromTime,
      'toTime': toTime,
    };
  }

  factory SpecialHours.fromMap(Map<String, dynamic> map) {
    return SpecialHours(
      id: map['id'] as int,
      fromDate: map['fromDate'] as String,
      toDate: map['toDate'] as String,
      fromTime: map['fromTime'] as String,
      toTime: map['toTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialHours.fromJson(String source) =>
      SpecialHours.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SpecialHours(id: $id, fromDate: $fromDate, toDate: $toDate, fromTime: $fromTime, toTime: $toTime)';
  }

  @override
  bool operator ==(covariant SpecialHours other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fromDate == fromDate &&
        other.toDate == toDate &&
        other.fromTime == fromTime &&
        other.toTime == toTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fromDate.hashCode ^
        toDate.hashCode ^
        fromTime.hashCode ^
        toTime.hashCode;
  }
}
