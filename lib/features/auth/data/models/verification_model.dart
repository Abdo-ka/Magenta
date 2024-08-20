// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🎯 Dart imports:

class VerificationModel {
  final String code;

  VerificationModel({
    required this.code,
  });

  VerificationModel copyWith({
    String? code,
  }) {
    return VerificationModel(
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
    };
  }
}
