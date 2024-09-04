class SignupReqParams {
  final String email;
  final String password;
  final String username;

  SignupReqParams({required this.email, required this.password, required this.username});

  Map<String, dynamic> toMap() {
    return <String, dynamic> {

      'email': email,
      'password': password,
      'username': username
    };
  }
}