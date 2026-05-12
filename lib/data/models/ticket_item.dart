class TicketItem {
  final String id;
  final String ticketNo;
  final String serviceId;
  final String status;

  const TicketItem({
    required this.id,
    required this.ticketNo,
    required this.serviceId,
    required this.status,
  });

  factory TicketItem.fromJson(Map<String, dynamic> json) {
    final serviceField = json['service'];
    String resolvedServiceId = '';
    if (serviceField is Map<String, dynamic>) {
      resolvedServiceId = (serviceField['_id'] ?? '').toString();
    } else {
      resolvedServiceId = (serviceField ?? '').toString();
    }

    return TicketItem(
      id: (json['_id'] ?? '').toString(),
      ticketNo: (json['ticket_no'] ?? '').toString(),
      serviceId: resolvedServiceId,
      status: (json['status'] ?? 'pending').toString(),
    );
  }
}
