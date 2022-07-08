class Question {
  String ques;
  List<Object> answers;
  String Rightans;
  Question({required this.ques, required this.answers, required this.Rightans});

  bool isCorrect(String chosenAnswer) {
    if (chosenAnswer == Rightans)
      return true;
    else
      return false;
  }
}
