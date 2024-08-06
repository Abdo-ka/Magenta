// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Status signUpStatus;
  const SignUpState({
    this.signUpStatus = Status.initial,
  });

  @override
  List<Object> get props => [
        signUpStatus,
      ];

  SignUpState copyWith({
    Status? signUpStatus,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
    );
  }
}
