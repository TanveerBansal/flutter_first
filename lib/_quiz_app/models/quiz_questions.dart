class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    //List.of will create new list (basically copy), here we are creating copy because the shuffle method mutate the orignal data
    final shufflesList = List.of(answers);
    shufflesList.shuffle();
    return shufflesList;
  }
}
