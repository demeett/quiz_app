// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class QuizCubitState extends Equatable {
  const QuizCubitState({
    this.isAnswered,
    this.correctAns,
    this.numOfCorrectAns,
    this.selectAns,
    this.questionNumber,
  });

  final bool? isAnswered;
  final int? correctAns;
  final int? selectAns;
  final int? questionNumber;
  final int? numOfCorrectAns;

  @override
  List<Object?> get props => [
        isAnswered,
        correctAns,
        selectAns,
        questionNumber,
        numOfCorrectAns,
      ];

  QuizCubitState copyWith({
    bool? isAnswered,
    int? correctAns,
    int? selectAns,
    int? questionNumber,
    int? numOfCorrectAns,
  }) {
    return QuizCubitState(
      isAnswered: isAnswered ?? this.isAnswered,
      correctAns: correctAns ?? this.correctAns,
      selectAns: selectAns ?? this.selectAns,
      questionNumber: questionNumber ?? this.questionNumber,
      numOfCorrectAns: numOfCorrectAns ?? this.numOfCorrectAns,
    );
  }
}
