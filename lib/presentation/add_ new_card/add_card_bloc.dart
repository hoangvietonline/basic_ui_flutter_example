import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardState {
  AddCardState({this.month = 0, this.year = 2020, this.cardNumber});

  int month = 0;
  int year = 2020;
  String? cardNumber;

  AddCardState copyWith({int month = 0, int year = 2020, String? cardNumber}) {
    return AddCardState(month: month, year: year, cardNumber: cardNumber);
  }
}

class AddCardBloc extends Cubit<AddCardState> {
  AddCardBloc() : super(AddCardState());

  void onChangeMonth({required int month}) {
    emit(state.copyWith(month: month));
  }

  void onChangeYear({required int year}) {
    emit(state.copyWith(year: year));
  }

  void onChangeCardNumber({required String cardNumber}) {
    emit(state.copyWith(cardNumber: cardNumber));
  }
}
