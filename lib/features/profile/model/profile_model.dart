
class ProfileModel {
  final String status;
  final DocModel doc;

  ProfileModel({required this.status, required this.doc});

  factory ProfileModel.fromjson(Map<String, dynamic> jsonDate) {
    return ProfileModel(
        doc: DocModel.fromjson(jsonDate['doc']), status: jsonDate['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'doc': doc.toJson(),
    };
  }
}

class DocModel {
  final String? id;
  final bool active;
  final String email;
  final String name;
  final String phone;
  final String photo;

  DocModel(
      {required this.id,
      required this.active,
      required this.email,
      required this.name,
      required this.phone,
      required this.photo});

  factory DocModel.fromjson(Map<String, dynamic> jsonDate) {
    return DocModel(
      active: jsonDate['active'],
      email: jsonDate['email'],
      id: jsonDate['id'],
      name: jsonDate['name'],
      phone: jsonDate['phone'],
      photo: jsonDate['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': active.toString(),
      'email': email,
      'id': id,
      'name': name,
      'phone': phone,
      'photo': photo,
    };
  }
}

