// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final Status SignInStatus;
  const SignInState({this.SignInStatus = Status.initial});

  @override
  List<Object> get props => [
        SignInStatus,
      ];

  SignInState copyWith({
    Status? SignInStatus,
  }) {
    return SignInState(
      SignInStatus: SignInStatus ?? this.SignInStatus,
    );
  }
}
