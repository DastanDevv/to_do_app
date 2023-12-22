class TodoModel {
  const TodoModel({
    this.uid,
    required this.tema,
    required this.tapshyrma,
    required this.ubakyt,
  });

  final String? uid;
  final String tema;
  final String tapshyrma;
  final String ubakyt;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tema': tema,
      'tapshyrma': tapshyrma,
      'ubakyt': ubakyt,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json, String uid) {
    return TodoModel(
      uid: uid,
      tema: json['tema'] as String,
      tapshyrma: json['tapshyrma'] as String,
      ubakyt: json['ubakyt'] as String,
    );
  }
}
