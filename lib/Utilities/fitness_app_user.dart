class FitnessUser {
  static int age = -1;
  static int weight = -1;
  static int height = -1;
  static bool gender = true;
  static String name = "";
  static String email = "";
  static String uid = "";
  static String password = "";

  static final FitnessUser _fitnessUserInstance = FitnessUser._instance();
  FitnessUser._instance();
  factory FitnessUser() {
    return _fitnessUserInstance;
  }
}
