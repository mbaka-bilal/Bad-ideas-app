enum Role {
  student,
  teacher,
  admin;

  static Role fromString(String role) {
    return Role.values.firstWhere((e) => e.name == role);
  }
}
