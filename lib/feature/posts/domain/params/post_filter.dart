class PostFilter {
  final String? search;
  final int? categoryId;
  final int? type;
  final String? location;
  final int page;
  final int pageSize;

  const PostFilter({
    this.search,
    this.categoryId,
    this.type,
    this.location,
    this.page = 1,
    this.pageSize = 10,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      if (search != null && search!.isNotEmpty) 'search': search,
      if (categoryId != null) 'categoryId': categoryId,
      if (type != null) 'type': type,
      if (location != null && location!.isNotEmpty) 'location': location,
      'page': page,
      'pageSize': pageSize,
    };
  }

  PostFilter copyWith({
    String? search,
    int? categoryId,
    int? type,
    String? location,
    int? page,
    int? pageSize,
  }) {
    return PostFilter(
      search: search ?? this.search,
      categoryId: categoryId ?? this.categoryId,
      type: type ?? this.type,
      location: location ?? this.location,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}
