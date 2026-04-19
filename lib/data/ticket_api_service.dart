import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config/app_config.dart';
import 'models/ticket_dm.dart';

class TicketApiService {
  final String baseUrl;
  final http.Client _client;

  TicketApiService({
    String? baseUrl,
    http.Client? client,
  })  : baseUrl = baseUrl ?? AppConfig.adminBaseUrl,
        _client = client ?? http.Client();

  Future<TicketDm> createTicket({
    required String roleTitle,
    required String serviceId,
  }) async {
    final uri = Uri.parse('$baseUrl/tickets');

    String mappedRole = 'student';
    if (roleTitle == 'ولي أمر') mappedRole = 'parent';
    if (roleTitle == 'خريج') mappedRole = 'graduate';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode({
      'service': serviceId,
      'person': mappedRole
    });

    final res = await _client.post(uri, headers: headers, body: body);

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Ticket creation failed: ${res.statusCode} ${res.body}');
    }

    final decoded = jsonDecode(res.body);
    return TicketDm.fromJson(decoded);
  }

  Future<String> getRemainingWaitingCount(String serviceId) async {
    final uri = Uri.parse('$baseUrl/tickets/remaining?service=$serviceId');

    final headers = <String, String>{
      'Accept': 'application/json',
    };

    try {
      final res = await _client.get(uri, headers: headers);

      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decoded = jsonDecode(res.body);
        return decoded['data']['remaining'].toString();
      } else {
        return "-";
      }
    } catch (e) {
      return "-";
    }
  }

  Future<TicketDm> getTicketById(String ticketId) async {
    final uri = Uri.parse('$baseUrl/tickets/$ticketId');

    final headers = <String, String>{
      'Accept': 'application/json',
    };

    final res = await _client.get(uri, headers: headers);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final decoded = jsonDecode(res.body);
      return TicketDm.fromJson(decoded);
    } else {
      throw Exception('Failed to fetch ticket status');
    }
  }

  Future<void> cancelTicket(String ticketId) async {
    final uri = Uri.parse('$baseUrl/tickets/$ticketId');

    final headers = <String, String>{
      'Accept': 'application/json',
    };

    final res = await _client.delete(uri, headers: headers);

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Failed to cancel ticket: ${res.statusCode} ${res.body}');
    }
  }
}