import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../infrastructure/Base/presentation/bloc/base_state.dart';
import '../../../../infrastructure/helpers/constants/app_colors.dart';
import '../cubit/home_screen_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, BaseState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Container(
            margin: const EdgeInsets.only(top: 120),
            child: Center(
              child: Column(
                children: [
                  if (state is LoadingState) const Text("loading"),
                  if (state is SuccessState)
                    Text("success ${state.props.first.toString()}"),
                  if (state is FailureState) Text(state.props.first.toString()),
                  ElevatedButton(
                    child: const Text('Get data'),
                    onPressed: () {
                      context.read<HomeScreenCubit>().getDate();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
