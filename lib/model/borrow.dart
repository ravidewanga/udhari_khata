const String tableFiles = 'files';

class BorrowFields{
  static final List<String> values = [id,personName,amount,interest,returnDate,createdAt,updatedAt,status];
  static const String id = '_id';
  static const String personName = 'personName';
  static const String amount = 'amount';
  static const String interest = 'interest';
  static const String returnDate = 'returnDate';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String status = 'status';
}

class BorrowList{
  final int? id;
  final String? personName;
  final double? amount;
  final double? interest;
  final String? returnDate;
  final String? createdAt;
  final String? updatedAt;
  final int? status;
  const BorrowList({this.id,this.personName,this.amount,this.interest,this.returnDate,this.createdAt,this.updatedAt,this.status});



  BorrowList copy(
      { int? id,
        String? personName,
        double? amount,
        double? interest,
        String? returnDate,
        String? createdAt,
        String? updatedAt,
        int? status}) =>
      BorrowList(
          id: id ?? this.id,
          personName: personName ?? this.personName,
          amount: amount ?? this.amount,
          interest: interest ?? this.interest,
          returnDate: returnDate ?? this.returnDate,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          status: status ?? this.status
      );

  static BorrowList fromJson(Map<String, Object?> json) => BorrowList(
      id: json[BorrowFields.id] as int,
      personName: json[BorrowFields.personName] as String,
      amount: json[BorrowFields.amount] as double,
      interest: json[BorrowFields.interest] as double,
      returnDate: json[BorrowFields.returnDate] as String,
      createdAt: json[BorrowFields.createdAt] as String,
      updatedAt: json[BorrowFields.updatedAt] as String,
      status: json[BorrowFields.status] as int);

  Map<String, Object?> toJson() => {
    BorrowFields.id: id,
    BorrowFields.personName: personName,
    BorrowFields.amount: amount,
    BorrowFields.interest: interest,
    BorrowFields.returnDate: returnDate,
    BorrowFields.createdAt: createdAt,
    BorrowFields.updatedAt: updatedAt,
    BorrowFields.status: status
  };
}