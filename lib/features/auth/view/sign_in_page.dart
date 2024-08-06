// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart' hide StatusBloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/common/environment_variables.dart';
import 'package:magenta/config/theme/theme.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/features/auth/controller/sign_in_cubit/cubit/sign_in_cubit.dart';
import 'package:magenta/features/auth/data/models/sign_in_model.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/drawing/draw_line.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final bloc = getIt<SignInCubit>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final ValueNotifier isHidden = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: BlocProvider(
        create: (context) => bloc,
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              100.verticalSpace,
              AppImage.asset(
                EnvironmentVariables.flavor == Flavor.Dev
                    ? Assets.icons.logoDev
                    : EnvironmentVariables.flavor == Flavor.Stag
                        ? Assets.icons.logoStage
                        : Assets.icons.logo,
              ),
              8.verticalSpace,
              AppText.headlineMedium(
                'Welcome Back !',
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              120.verticalSpace,
              AppTextFormField(
                name: 'email',
                hintText: 'Enter your email address',
                textAlign: TextAlign.end,
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
                suffixIcon: AppImage.asset(Assets.icons.mail),
              ),
              26.verticalSpace,
              ListenableBuilder(
                listenable: isHidden,
                builder: (BuildContext context, Widget? child) =>
                    AppTextFormField(
                  name: 'password',
                  hintText: 'Enter your Password',
                  textAlign: TextAlign.end,
                  validator: FormBuilderValidators.required(),
                  suffixIcon: AppImage.asset(Assets.icons.lock),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          isHidden.value = !isHidden.value;
                        },
                        child: Stack(children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: context.colorScheme.primary,
                          ),
                          isHidden.value == false
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Line(),
                                )
                              : const SizedBox.shrink(),
                        ]),
                      ),
                    ],
                  ),
                  obscureText: isHidden.value,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         AppCheckbox(
              //           isSelected: true,
              //           width: 40,
              //           onChanged: (value) {},
              //         ),
              //         AppText('Rememebr me'),
              //       ],
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         context.router.push(const ResetPasswordRoute());
              //       },
              //       child: AppText('Forgot Password ?'),
              //     ),
              //   ],
              // ),
              26.verticalSpace,
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  switch (state.SignInStatus) {
                    case Status.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case (_):
                      return Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: context.colorScheme.primary.lighten(0.4),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                        child: ButtonWidget(
                          height: 50.h,
                          radius: 32,
                          onPressed: () {
                            if (!_formKey.currentState!.saveAndValidate())
                              return;
                            bloc.signIn(
                                param: SignInModel(
                                    email:
                                        _formKey.fieldValue('email').toString(),
                                    password: _formKey
                                        .fieldValue('password')
                                        .toString()),
                                onSuccess: () {
                                  context.router
                                      .replaceAll([const BaseRoute()]);
                                });
                          },
                          backgroundColor: context.colorScheme.primary,
                          textStyle: context.textTheme.titleMedium
                              ?.copyWith(color: context.colorScheme.onPrimary),
                          text: 'Log In',
                        ),
                      );
                  }
                },
              ),
              26.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('If you don\'t have an account '),
                  GestureDetector(
                    onTap: () {
                      context.router.push(SignUpRoute());
                    },
                    child: AppText(
                      'Sign up here!',
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              AppImage.asset(Assets.icons.rose),
            ],
          ),
        ),
      ),
    );
  }
}
