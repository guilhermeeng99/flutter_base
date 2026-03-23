import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/app/app.dart';
import 'package:flutter_base/features/progress/presentation/cubit/progress_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (_) {
        final cubit = ProgressCubit.create();
        unawaited(cubit.loadProgress());
        return cubit;
      },
      child: const App(),
    ),
  );
}
