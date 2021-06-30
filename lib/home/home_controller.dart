import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/progress_indicator/models/quiz_model.dart';
import 'package:devquiz/shared/progress_indicator/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRpository();

  void getUser() async{
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async{
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucess;
  }
}
