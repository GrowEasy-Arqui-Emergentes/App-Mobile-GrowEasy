import 'dart:convert';
import 'dart:io';
//import 'package:flutter_application_1/services/profile_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String _baseUrl = 'https://usersservice-gsgsachvh8fcahd3.canadacentral-01.azurewebsites.net/api/v1/users'; // URL del endpoint Flask
  
  Future<bool> authenticate(String email, String password) async {
    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'email': email,
      'password': password,
    });

    try {
      final response = await http.get(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == HttpStatus.ok) {

        //ProfileService _profileService = ProfileService();
        //var profile = await _profileService.fetchProfile(username);
        //UserSession.setRole(profile!.role);
        //print(profile.role);
        final jsonResponse = json.decode(response.body);
        final userId = jsonResponse['id'] as int;
        final firstName = jsonResponse['firstName'] as String;
        final lastName = jsonResponse['lastName'] as String;
        final email = jsonResponse['email'] as String;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', userId.toString());
        await prefs.setString('email', email);
        await prefs.setString('firstName', firstName);
        await prefs.setString('lastName', lastName);
        
        return true;

      } else {
        print('Error de autenticación: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return false;
  }
}
