// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'verification_cubit.dart';

class VerificationState extends Equatable {
  final Status verifcationStatus;
  const VerificationState({
    this.verifcationStatus = Status.initial,
  });

  @override
  List<Object> get props => [
        verifcationStatus,
      ];

  VerificationState copyWith({
    Status? verifcationStatus,
  }) {
    return VerificationState(
      verifcationStatus: verifcationStatus ?? this.verifcationStatus,
    );
  }
}
