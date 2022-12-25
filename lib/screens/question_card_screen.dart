import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/cubit/quiz_cubit.dart';
import 'package:quiz_app/cubit/quiz_cubit_state.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/screens/option_screen.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuestionCardScreen extends StatelessWidget {
  const QuestionCardScreen({
    Key? key,
    required this.questions,
    required this.pageController,
  }) : super(key: key);
  final Question questions;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: BlocBuilder<QuizCubit, QuizCubitState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  questions.question ?? "",
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
                ),
                ...List.generate(
                    questions.options?.length ?? 0,
                    (index) => OptionScreen(
                        index: index,
                        text: questions.options?[index] ?? "",
                        press: () async {
                          context.read<QuizCubit>().checkAnswer(questions, index, context);
                          if (state.questionNumber != question.length) {
                            await Future.delayed(const Duration(seconds: 1));
                            pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
                          } else {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const ScoreScreen();
                              },
                            ));
                          }
                        }))
              ],
            );
          },
        ),
      ),
    );
  }
}
