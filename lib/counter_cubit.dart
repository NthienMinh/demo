import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  int number1 = 0;
  int number2 = 0;

  increment(bool change) {
    number1++;
    emit(state + 1);
  }
}
