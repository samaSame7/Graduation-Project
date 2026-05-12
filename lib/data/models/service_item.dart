class ServiceItem {
  final String id;
  final String name;
  final List<String> requirements;

  const ServiceItem({
    required this.id,
    required this.name,
    required this.requirements,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    final rawRequirements = json['requirements'];
    final requirements = <String>[];
    if (rawRequirements is List) {
      for (final item in rawRequirements) {
        if (item == null) continue;
        requirements.add(item.toString());
      }
    }

    return ServiceItem(
      id: (json['_id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      requirements: requirements,
    );
  }
}
