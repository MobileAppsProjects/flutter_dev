import 'dart:convert';
import 'package:http/http.dart' as http;

class DUser {
  final String uid;
  final String email;
  final String password;

  const DUser({
    required this.uid,
    required this.email,
    required this.password,
  });

  factory DUser.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'uid': String uid,
        'email': String email,
        'password': String password,
      } =>
        DUser(
          uid: uid,
          email: email,
          password: password,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<DUser> fetchAlbum(String uid, String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('https://createuser-oecyufx2va-uc.a.run.app'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'uid': uid,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      return DUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  } catch (e) {
    print('Error: $e');
    throw e;
  }
}
