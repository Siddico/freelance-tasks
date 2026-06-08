class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isFavorite;
  final bool isAvailable;
  final List<String> images;
  final List<String> options;
  final Map<String, String> specifications;
  final List<Map<String, dynamic>> reviews;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
    this.isFavorite = false,
    this.isAvailable = true,
    this.images = const [],
    this.options = const [],
    this.specifications = const {},
    this.reviews = const [],
  });

  // Getter to ensure we always have at least one image in our list
  List<String> get allImages => images.isEmpty ? [imageUrl] : images;

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    double? rating,
    int? reviewCount,
    bool? isFavorite,
    bool? isAvailable,
    List<String>? images,
    List<String>? options,
    Map<String, String>? specifications,
    List<Map<String, dynamic>>? reviews,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFavorite: isFavorite ?? this.isFavorite,
      isAvailable: isAvailable ?? this.isAvailable,
      images: images ?? this.images,
      options: options ?? this.options,
      specifications: specifications ?? this.specifications,
      reviews: reviews ?? this.reviews,
    );
  }
}

