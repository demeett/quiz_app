import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/cubit/quiz_cubit.dart';
import 'package:quiz_app/cubit/quiz_cubit_state.dart';
import 'package:quiz_app/extension/string_extension.dart';
import 'package:quiz_app/model/questions.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/icons/cldd.jpg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SafeArea(
                child: Text(
                  "Sonuç",
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: kSecondaryColor,
                      ),
                ),
              ),
              BlocBuilder<QuizCubit, QuizCubitState>(
                builder: (context, state) {
                  return Text(
                    "${state.numOfCorrectAns.toString()}/${question.length.toString()}",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: kSecondaryColor,
                        ),
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index >= answers.length) {
                      answers.add("boş");
                    }
                    return Container(
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: (question[index].answer).toString() == answers[index] ? Colors.green : Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Row(
                        children: [
                          BlocBuilder<QuizCubit, QuizCubitState>(
                            builder: (context, state) {
                              return Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${question[index].id}. soruya verdiğiniz cevap: ${answers.isEmpty ? "boş" : answers[index].convertAnswer()} ",
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                    (question[index].answer).toString() == answers[index]
                                        ? const Icon(
                                            Icons.check,
                                            size: 26,
                                            color: Colors.green,
                                          )
                                        : Text("Doğru Cevap: ${(question[index].answer).toString().convertAnswer()}",
                                            style: const TextStyle(color: Colors.black)),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: question.length,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
