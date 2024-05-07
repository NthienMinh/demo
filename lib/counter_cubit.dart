import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCubit extends Cubit<int> {
  HotelCubit() : super(0);

  List<String>? listHotels;

  init(){
    listHotels = ['Hotel 1', 'Hotel 2', 'Hotel 3'];
    Future.delayed(const Duration(seconds: 2), (){
      emit(state+1);
    });
  }

  void addHotel(String hotel){
    listHotels!.add(hotel);
    emit(state+1);
  }
}

