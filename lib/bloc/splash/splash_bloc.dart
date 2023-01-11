import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
        if (event is NavigateEvent) {
          emit(SplashLoading());
          await Future.delayed(const Duration(seconds: 5));
          emit(SplashLoaded());
        }

      }
    );
  }
}
