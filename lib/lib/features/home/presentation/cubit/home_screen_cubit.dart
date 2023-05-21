import '../../../../infrastructure/Base/presentation/bloc/base_cubit.dart';
import '../../../../infrastructure/Base/presentation/bloc/base_state.dart';
import '../../../../infrastructure/networking/custom_exception.dart';
import '../../domain/home_get_date_use_case.dart';

class HomeScreenCubit extends BaseCubit {
  HomeScreenCubit(this.useCase) : super(InitialState());

  final GetDataUseCase useCase;

  Future<void> getDate() async {
    emit(LoadingState());

    try {
      final response = await useCase.getRoute();
      emit(SuccessState(response.email));
    } on CustomException catch (e) {
      emit(FailureState(e.message));
    }
  }
}
