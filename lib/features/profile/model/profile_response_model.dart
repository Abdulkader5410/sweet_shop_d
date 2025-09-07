
class Pro {
  final String? id, name, email, photo, phone;
  bool active;

  Pro(
      {required this.id,
      required this.name,
      required this.email,
      required this.photo,
      required this.phone,
      required this.active});

  factory Pro.fromjson(Map<String, dynamic> jsonDate) {
    return Pro(
        id: jsonDate['_id'],
        name: jsonDate['name'],
        email: jsonDate['email'],
        photo: jsonDate['photo'],
        phone: jsonDate['phone'],
        active: jsonDate['active']);
  }
}

class Data {
  Pro pro;

  Data({required this.pro});

  factory Data.fromjson(Map<String, dynamic> jsonDate) {
    return Data(
      pro: Pro.fromjson(jsonDate['user']),
    );
  }
}

class ProResModel {
  String status;
  Data data;

  ProResModel({required this.status, required this.data});

  factory ProResModel.fromjson(Map<String, dynamic> jsonDate) {
    return ProResModel(
      status: jsonDate['status'],
      data: Data.fromjson(jsonDate['data']),
    );
  }
}
