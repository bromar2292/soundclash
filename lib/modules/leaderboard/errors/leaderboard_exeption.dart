class LeaderboardExeption implements Exception {
  final String message;

  LeaderboardExeption(this.message);

  @override
  String toString() => 'LeaderboardExeption(message: $message)';
}
