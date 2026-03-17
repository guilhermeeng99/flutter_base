class CacheException implements Exception {
  const CacheException([this.message = 'Cache error occurred']);
  final String message;

  @override
  String toString() => 'CacheException: $message';
}
