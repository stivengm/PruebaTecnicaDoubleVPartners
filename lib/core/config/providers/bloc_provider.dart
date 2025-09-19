import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_doublevpartners/core/blocs/register/register_bloc.dart';

final List<BlocProvider> blocProvider = [
  BlocProvider<RegisterBloc>(create: ( _ ) => RegisterBloc()),
];