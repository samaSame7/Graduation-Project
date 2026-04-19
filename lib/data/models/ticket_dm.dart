class TicketDm {
  final String id;
  final String ticketNo;
  final String status;
  final String serviceId;
  final String serviceName;
  final String personType;

  TicketDm({
    required this.id,
    required this.ticketNo,
    required this.status,
    required this.serviceId,
    required this.serviceName,
    required this.personType,
  });

  factory TicketDm.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return TicketDm(
      id: data['_id']?.toString() ?? '',
      ticketNo: data['ticket_no']?.toString() ?? '',
      status: data['status']?.toString() ?? 'pending',
      serviceId: data['service']?['_id']?.toString() ?? '',
      serviceName: data['service']?['name']?.toString() ?? '',
      personType: data['person']?['type']?.toString() ?? '',
    );
  }
}