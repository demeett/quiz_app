import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/quiz_cubit_state.dart';
import 'package:quiz_app/model/questions.dart';

class QuizCubit extends Cubit<QuizCubitState> {
  QuizCubit()
      : super(const QuizCubitState(
            isAnswered: false, correctAns: 0, numOfCorrectAns: 0, selectAns: 0, questionNumber: 1));
  void checkAnswer(Question question, int selectedIndex, BuildContext context) {
    emit(
      state.copyWith(
        isAnswered: true,
        correctAns: question.answer ?? 0,
        selectAns: selectedIndex,
        numOfCorrectAns: question.answer == selectedIndex ? (state.numOfCorrectAns ?? 0) + 1 : state.numOfCorrectAns,
      ),
    );
    answers.add((state.selectAns).toString());
    Future.delayed(
      const Duration(seconds: 1),
      () {
        emit(
          state.copyWith(
            correctAns: 0,
            selectAns: 0,
            isAnswered: false,
          ),
        );
      },
    );
  }

  void updateToQnNum(int index) {
    emit(state.copyWith(questionNumber: index + 1));
  }
}
