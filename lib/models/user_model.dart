class UserModel {
  List<User>? users;
  UserModel(this.users);
  String? error;

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      users = [];
      json['data'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.global != null) {
  //     data['Global'] = this.global.toJson();
  //   }
  //   if (this.countries != null) {
  //     data['Countries'] = this.countries.map((v) => v.toJson()).toList();
  //   }
  //   data['Date'] = this.date;
  //   return data;
  // }
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}
