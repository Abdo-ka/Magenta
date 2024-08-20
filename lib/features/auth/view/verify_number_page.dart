// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart' hide StatusBloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/theme/theme.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/features/auth/controller/verification_cubit/cubit/verification_cubit.dart';
import 'package:magenta/features/auth/data/models/verification_model.dart';
import 'package:magenta/features/auth/view/widget/verification_field.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class VerifyNumberPage extends StatefulWidget {
  const VerifyNumberPage({super.key});

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  final otpController = TextEditingController();
  final bloc = getIt<VerificationCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBarWidget(
          title: AppText.headlineMedium('Verify Number'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            80.verticalSpace,
            Center(
              child: Column(
                children: [
                  50.verticalSpace,
                  AppText.headlineMedium('Verify your number'),
                  30.verticalSpace,
                  AppText(
                    'Enter your OTP code below:',
                    color: context.colorScheme.secondaryText,
                  ),
                  16.verticalSpace,
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: VerificationField(otpController: otpController),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: context.colorScheme.primary.lighten(0.4),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ]),
              child: BlocBuilder<VerificationCubit, VerificationState>(
                  builder: (context, state) {
                
                switch (state.verifcationStatus) {
                  case Status.loading:
                    return const Center(child: CircularProgressIndicator());
                  case (_):
                    return ButtonWidget(
                      height: 50.h,
                      radius: 32,
                      onPressed: () {
                        bloc.verification(
                            param: VerificationModel(code: otpController.text),
                            onSuccess: () {
                              context.router.replaceAll([const BaseRoute()]);
                            });
                      },
                      backgroundColor: context.colorScheme.primary,
                      textStyle: context.textTheme.titleMedium
                          ?.copyWith(color: context.colorScheme.onPrimary),
                      text: 'Verify Account',
                    );
                }
              }),
            ),
            35.verticalSpace,
            // Column(
            //   children: [
            //     AppText('didn\'t receive the code ?'),
            //     8.verticalSpace,
            //     AppText(
            //       'Resend a new code',
            //       style: context.textTheme.titleMedium
            //           ?.copyWith(fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
