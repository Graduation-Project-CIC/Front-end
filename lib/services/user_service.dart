class UserInformation {
  String firstName;
  String lastName;
  String email;
  String address;
  String phoneNumber;
  int? age;

  UserInformation(
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.phoneNumber,
      this.age,

      );

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'age' :age,
    };
  }
}






