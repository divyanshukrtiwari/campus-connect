class Quiz {
  int responseCode;
  List<Results> results;

  Quiz({this.responseCode, this.results});

  Quiz.fromJson(Map<String, dynamic> json) {
    responseCode = json["response_code"] as int;
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(Results.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> allAnswers;

  Results(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.allAnswers});

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'] as String;
    type = json['type'] as String;
    difficulty = json['difficulty'] as String;
    question = json['question'] as String;
    correctAnswer = json['correct_answer'] as String;
    allAnswers = json['incorrect_answers'].cast<String>() as List<String>;
    allAnswers.add(correctAnswer);
    allAnswers.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.allAnswers;
    return data;
  }
}
