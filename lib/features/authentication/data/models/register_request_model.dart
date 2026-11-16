class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String? profileImage;

  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    this.profileImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirm_password': confirmPassword,
      if (profileImage != null) 'profile_image': profileImage,
    };
  }
}
