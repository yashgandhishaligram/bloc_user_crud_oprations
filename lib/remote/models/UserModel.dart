class UserModel {
  UserModel({
      this.id, 
      this.userId, 
      this.name, 
      this.mobileNumber, 
      this.email, 
      this.gender, 
      this.jobPreference,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    gender = json['gender'];
    jobPreference = json['job_preference'];
  }
  int? id;
  int? userId;
  String? name;
  int? mobileNumber;
  String? email;
  String? gender;
  String? jobPreference;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['mobile_number'] = mobileNumber;
    map['email'] = email;
    map['gender'] = gender;
    map['job_preference'] = jobPreference;
    return map;
  }

}