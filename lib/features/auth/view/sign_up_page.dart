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
import 'package:magenta/features/auth/controller/sign_up_cubit/cubit/sign_up_cubit.dart';
import 'package:magenta/features/auth/data/models/sign_up_model.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/drawing/draw_line.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  final bloc = getIt<SignUpCubit>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  SignUpPage({super.key});

  final ValueNotifier isHidden = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: BlocProvider(
          create: (context) => bloc,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              30.verticalSpace,
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: context.colorScheme.primary,
                      size: 18,
                    ),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              Column(
                children: [
                  AppImage.asset(
                    EnvironmentVariables.flavor == Flavor.Dev
                        ? Assets.icons.logoDev
                        : EnvironmentVariables.flavor == Flavor.Stag
                            ? Assets.icons.logoStage
                            : Assets.icons.logo,
                  ),
                  10.verticalSpace,
                  AppText.headlineMedium(
                    'Welcome !',
                    style: context.textTheme.headlineMedium?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              26.verticalSpace,
              AppTextFormField(
                name: 'email',
                hintText: 'Enter your email address',
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                suffixIcon: AppImage.asset(Assets.icons.mail),
              ),
              26.verticalSpace,
              AppTextFormField(
                name: 'name',
                hintText: 'Enter your username',
                textAlign: TextAlign.left,
                keyboardType: TextInputType.name,
                validator: FormBuilderValidators.required(),
                suffixIcon: AppImage.asset(Assets.icons.user),
              ),
              26.verticalSpace,
              AppTextFormField(
                name: 'phone',
                hintText: 'Enter your phone number',
                textAlign: TextAlign.left,
                maxLength: 10,
                keyboardType: TextInputType.phone,
              validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(10),
                ]),
                suffixIcon: AppImage.asset(Assets.icons.phone),
              ),
              ValueListenableBuilder(
                valueListenable: isHidden,
                builder: (BuildContext context, value, Widget? child) => Column(
                  children: [
                    26.verticalSpace,
                    AppTextFormField(
                      name: 'password',
                      hintText: 'Enter your Password',
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.required(),
                      obscureText: isHidden.value,
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
                    ),
                    26.verticalSpace,
                    AppTextFormField(
                      name: 'confirmPassword',
                      hintText: 'Confirm your Password',
                      validator: FormBuilderValidators.equal(
                          _formKey.fieldValue('password').toString(),
                          errorText: 'Password must be match'),
                      textAlign: TextAlign.left,
                      obscureText: isHidden.value,
                      suffixIcon: AppImage.asset(Assets.icons.lock),
                    ),
                  ],
                ),
              ),
              26.verticalSpace,
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  switch (state.signUpStatus) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
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

                            bloc.SignUp(
                              model: SignUpModel(
                                email: _formKey.fieldValue('email').toString(),
                                name: _formKey.fieldValue('name').toString(),
                                phone: _formKey.fieldValue('phone').toString(),
                                password:
                                    _formKey.fieldValue('password').toString(),
                              ),
                              onSuccess: () {
                                context.router.push(const VerifyNumberRoute());
                              },
                            );
                          },
                          backgroundColor: context.colorScheme.primary,
                          textStyle: context.textTheme.titleMedium
                              ?.copyWith(color: context.colorScheme.onPrimary),
                          text: 'Sign Up',
                        ),
                      );
                  }
                  ;
                },
              ),
              26.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('If you have an account '),
                  GestureDetector(
                    onTap: () {
                      context.router.maybePop();
                    },
                    child: AppText(
                      'Sign In here!',
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
