import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/cubit/home_screen_cubit.dart';
import 'injecatable_config.dart';

List<BlocProvider> get appProviders => [
      BlocProvider<HomeScreenCubit>(create: (_) => HomeScreenCubit(getIt.get()))
    ];
