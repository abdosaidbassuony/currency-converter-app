class Result {
  dynamic results;

  Result({
    this.results,
  });

  Result.fromJson(dynamic json) {
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.toJson();
    }
    return map;
  }
}
