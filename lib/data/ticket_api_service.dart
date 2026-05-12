import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config/app_config.dart';
import '../core/config/end_points.dart';
import 'models/ticket_item.dart';

class TicketApiService {
  final String baseUrl;
  final http.Client _client;

  TicketApiService({
    String? baseUrl,
    http.Client? client,
  })  : baseUrl = baseUrl ?? AppConfig.publicApiBaseUrl,
        _client = client ?? http.Client();

  Future<TicketItem> createTicket({
    required String serviceId,
    required String personType,
  }) async {
    final uri = Uri.parse('$baseUrl${Endpoints.tickets}');
    final res = await _client.post(
      uri,
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service': serviceId,
        'person': personType,
      }),
    );

    if (res.statusCode != 201) {
      throw Exception('Create ticket failed: ${res.statusCode} ${res.body}');
    }

    final decoded = jsonDecode(res.body);
    if (decoded is! Map<String, dynamic> || decoded['data'] is! Map<String, dynamic>) {
      throw Exception('Unexpected create ticket response shape');
    }

    return TicketItem.fromJson(decoded['data'] as Map<String, dynamic>);
  }

  Future<int> getRemainingByTicketId(String ticketId) async {
    final uri = Uri.parse('$baseUrl${Endpoints.tickets}/$ticketId/${Endpoints.remaining}');
    final res = await _client.get(uri, headers: const {
      'Accept': 'application/json',
    });

    if (res.statusCode != 200) {
      throw Exception('Get remaining failed: ${res.statusCode} ${res.body}');
    }

    final decoded = jsonDecode(res.body);
    final data = (decoded is Map<String, dynamic>) ? decoded['data'] : null;
    final remaining = (data is Map<String, dynamic>) ? data['remaining'] : null;
    if (remaining is! num) return 0;
    return remaining.toInt();
  }

  Future<void> cancelTicket(String ticketId) async {
    final uri = Uri.parse('$baseUrl${Endpoints.tickets}/$ticketId');
    final res = await _client.delete(uri, headers: const {
      'Accept': 'application/json',
    });

    if (res.statusCode != 204) {
      throw Exception('Cancel ticket failed: ${res.statusCode} ${res.body}');
    }
  }
}
