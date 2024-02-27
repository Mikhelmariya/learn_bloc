import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/visibility_bloc/visibility_event.dart';
import 'package:learn_bloc/visibility_bloc/visibility_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState(isVisible: true)) {
    on<MakeVisible>((event, emit) => emit(VisibilityState(isVisible: true)));
    {}
    on<MakeInvisible>((event, emit) => emit(VisibilityState(isVisible: false)));
    {}
  }
}
