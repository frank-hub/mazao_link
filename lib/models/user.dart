
class CurrentUser {
  final String uid;

   CurrentUser({
    this.uid,
  });
}
class UserData {
  String uid;
  String name;
  String email;
  String county;
  String location;
  String gender;
  int phone;
  String address;

  UserData(
      {this.uid,
        this.location,
        this.name,
        this.email,
        this.address,
        this.county,
        this.phone,
        this.gender});
}
