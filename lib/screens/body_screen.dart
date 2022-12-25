import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/cubit/quiz_cubit.dart';
import 'package:quiz_app/cubit/quiz_cubit_state.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/screens/progress_bar_screen.dart';
import 'package:quiz_app/screens/question_card_screen.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/icons/cldd.jpg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: BlocBuilder<QuizCubit, QuizCubitState>(
                  builder: (context, state) {
                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "/${question.length}",
                              style: Theme.of(context).textTheme.headline5?.copyWith(color: kSecondaryColor))
                        ],
                        text: "Soru ${state.questionNumber}",
                        style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(child: BlocBuilder<QuizCubit, QuizCubitState>(
                builder: (context, state) {
                  return PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: context.read<QuizCubit>().updateToQnNum,
                    itemCount: question.length,
                    itemBuilder: (context, index) {
                      return QuestionCardScreen(
                        questions: question[index],
                        pageController: pageController,
                      );
                    },
                  );
                },
              ))
            ],
          ),
        )
      ],
    );
  }
}
