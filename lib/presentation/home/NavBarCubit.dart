import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(2);

  void changeIndex(int index) {
    emit(index);
  }
}
