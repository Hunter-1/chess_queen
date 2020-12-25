class Score {
  final int moves;
  final int secondspassed;
  final bool isqueen;
  final String username;

  Score({this.moves, this.secondspassed, this.isqueen, this.username});

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
        moves: json["moves"] as int,
        secondspassed: json["secondspassed"] as int,
        isqueen: json["isqueen"] as bool,
        username: json["username"] as String
    );
  }
}