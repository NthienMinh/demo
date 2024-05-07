import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCubit extends Cubit<int> {
  NumberCubit() : super(0);

  List<String>? listNumber;

  init(){
    listNumber = ['Number 1', 'Number 2', 'Number 3'];
    Future.delayed(const Duration(seconds: 2), (){
      emit(state+1);
    });
  }

  void addNumber(String number){
    listNumber!.add(number);
    emit(state+1);
  }
}

