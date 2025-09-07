class ErrModel {
  final dynamic status, msg;

  ErrModel({required this.status, required this.msg});

  factory ErrModel.fromJson(Map<String, dynamic> jsonDate) {
    return ErrModel(status: jsonDate['status'], msg: jsonDate['message']);
  }
}

