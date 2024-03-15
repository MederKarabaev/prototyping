import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prototyping/core/functions/cash_func.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prototyping/core/functions/push_router_func.dart';
import 'package:prototyping/routes/mobile_auto_router.gr.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.prefs}) : super(const SplashState.initial()) {
    init();
  }
  final SharedPreferences prefs;

  Future<void> init() async {
    final token = prefs.getBool(CacheFunc.keyExample) ?? false;
    await Future.delayed(const Duration(seconds: 2));

    if (token == true) {
      AppRouting.pushAndPopUntilFunction(const HomeVeRoute());
    } else {
      AppRouting.pushAndPopUntilFunction(const AuthViewRoute());
    }
  }
}
