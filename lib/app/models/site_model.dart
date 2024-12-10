class Site {
  final String name;
  final String description;
  final String address;
  final String imageUrl;

  Site({
    required this.name,
    required this.description,
    required this.address,
    required this.imageUrl,
  });

  // Factory constructor to create Site from JSON (if you're fetching from an API)
  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Method to convert Site object to JSON (if you need to send it to an API)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'address': address,
      'imageUrl': imageUrl,
    };
  }
}
