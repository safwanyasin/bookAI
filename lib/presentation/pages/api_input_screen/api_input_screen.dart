import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/application/api_input/api_input_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/api_input_screen/widgets/api_input_form.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ApiInputScreen extends StatelessWidget {
  const ApiInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (_) => AutoRouter.of(context).replace(
            const LoginRoute(),
          ),
          orElse: () {},
        );
      },
      child: Scaffold(
          body: Stack(children: [
        const AnimatedBackground(),
        Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter your Gemini AI API key',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                BlocProvider(
                  create: (context) => getIt<ApiInputCubit>(),
                  child: ApiInputForm(),
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
