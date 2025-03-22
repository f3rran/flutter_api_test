class Breed {
  final String name;
  final String imageUrl;
  final String temperament;
  final String weight;
  final String height;
  final String origin;

  Breed({
    required this.name,
    required this.imageUrl,
    required this.temperament,
    required this.weight,
    required this.height,
    required this.origin,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'] ?? 'Unknown',
      imageUrl:
          (json['image'] != null && json['image']['url'] != null)
              ? json['image']['url']
              : '',
      temperament: json['temperament'] ?? 'Not specified',
      weight:
          json['weight'] != null && json['weight']['metric'] != null
              ? json['weight']['metric']
              : 'Unavailable',
      height:
          json['height'] != null && json['height']['metric'] != null
              ? json['height']['metric']
              : 'Unavailable',
      origin: json['origin'] ?? 'Unknown',
    );
  }
}
