import 'dart:convert';

class UserModel {
  final String useremail;
  final String username;
  final String userprofilepic;
  final String uid;
  final String utoken;

  UserModel(
      {required this.useremail,
      required this.username,
      required this.userprofilepic,
      required this.uid,
      required this.utoken});

//put data to server(c to s)
  Map<String, dynamic> toMap() {
    return {
      'useremail': useremail,
      'username': username,
      'userprofilepic': userprofilepic,
      'uid': uid,
      'utoken': utoken,
    };
  }

//when data is coming form server(s to c)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      useremail: map['useremail'] ?? '',
      username: map['username'] ?? '',
      userprofilepic: map['userprofilepic'] ?? '',
      uid: map['_id'] ?? '',
      utoken: map['utoken'] ?? '',
    );
  }

//encode(c to s)
  String toJson() => json.encode(toMap());

//decode(s to c)
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

//copy with fuction
  UserModel copyWith({
    String? useremail,
    String? username,
    String? userprofilepic,
    String? uid,
    String? utoken,
  }) {
    return UserModel(
      useremail: useremail ?? this.useremail,
      username: username ?? this.username,
      userprofilepic: userprofilepic ?? this.userprofilepic,
      uid: uid ?? this.uid,
      utoken: utoken ?? this.utoken,
    );
  }
}
