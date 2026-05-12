import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config/app_config.dart';
import '../core/config/end_points.dart';
import 'models/service_item.dart';

class ServicesApiService {
  final String baseUrl;
  final http.Client _client;

  ServicesApiService({
    String? baseUrl,
    http.Client? client,
  })  : baseUrl = baseUrl ?? AppConfig.publicApiBaseUrl,
        _client = client ?? http.Client();

  Future<List<ServiceItem>> fetchServices() async {
    final uri = Uri.parse('$baseUrl${Endpoints.services}');
    final res = await _client.get(uri, headers: const {
      'Accept': 'application/json',
    });

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Services request failed: ${res.statusCode} ${res.body}');
    }

    final decoded = jsonDecode(res.body);
    if (decoded is! Map<String, dynamic> || decoded['data'] is! List) {
      throw Exception('Unexpected services response shape');
    }

    return (decoded['data'] as List)
        .whereType<Map<String, dynamic>>()
        .map(ServiceItem.fromJson)
        .toList(growable: false);
  }
}
