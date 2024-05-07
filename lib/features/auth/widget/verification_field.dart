import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerificationField extends StatefulWidget {
  const VerificationField({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  State<VerificationField> createState() => _VerificationFieldState();
}

class _VerificationFieldState extends State<VerificationField>
    with CodeAutoFill {
  final smsAutoFill = SmsAutoFill();

  @override
  void initState() {
    listenForCode();
    super.initState();
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: widget.otpController,
      animationCurve: Curves.bounceIn,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      errorPinTheme: PinTheme(
        width: 53.w,
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 53.w,
        height: 65.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: 53.w,
        textStyle: context.textTheme.titleLarge
            ?.copyWith(color: context.colorScheme.primary),
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.gray),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  @override
  void codeUpdated() {
    if (code != null && code?.length == 6) widget.otpController.text = code!;
  }
}
