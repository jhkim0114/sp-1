class Example4 {

  /// var vs dynamic
  void main() {
    /// var: 타입 추론
    var age = 7;
    var name = '쫄랑이';
    var human = false;
    age = 15;
    // age = '사과'; //error

    /// dynamic: 동적 타입 지정
    dynamic something = 7;
    something = '쫄랑이';
    something = false;
  }

}