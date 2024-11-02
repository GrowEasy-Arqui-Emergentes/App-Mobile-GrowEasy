  import 'dart:convert';
  import 'dart:io';
  import 'package:flutter_application_1/models/product.dart';
  import 'package:http/http.dart' as http;

  class ProductService {
    final String _baseUrl = 'https://articlesservice-e5fjdtfpbjgvhzaj.canadacentral-01.azurewebsites.net/api/v1/articles'; 

    Future<List<Product>?> fetchProducts() async {
      final uri = Uri.parse(_baseUrl);

      try {
        final response = await http.get(
          uri,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );

        if (response.statusCode == HttpStatus.ok) {
          // Decodifica la respuesta JSON y devuelve la lista de productos
          final List<dynamic> jsonResponse = json.decode(response.body);
          return jsonResponse.map((json) => Product.fromJson(json)).toList().cast<Product>();
        } else {
          print('Error al obtener productos: ${response.body}');
        }
      } catch (e) {
        print('Error: $e');
      }
      return null;
    }
  }