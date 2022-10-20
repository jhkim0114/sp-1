class Example {

  void example1() {

    /// int: 정수형
    int i = 1;

    /// double: 실수형
    double d = 2.0;

    /// num: int, double을 포함하는 타입
    num n1 = 3;
    num n2 = 4.0;

    /// bool: true, false
    bool b = true;

    /// String: 문자열 (보통 작은 따옴표로 표시)
    String s1 = '';
    String s2 = "";

  }

  void example2() {

    /// var: 타입 추론
    var age = 7;
    var kind = 'pomeranian';
    var human = false;
    age = 20;
    // age = 'hi'; //error

    /// dynamic: 동적 타입 지정
    dynamic something = 9;
    something = 'apple';
    something = true;

  }

  void example3() {

    /// List: 중복을 허용하며 순서가 있는 집합
    List<int> list = [1, 2, 3];

    /// Set: 중복을 허용하지 않고 순서가 없는 집합
    Set<String> set = {'s1', 's2', 's3'};

    /// Map: key-value 쌍으로 구성된 집합
    Map<String, int> map = {'k1':1, 'k2':2, 'k3':3};

  }

  String example4() {
    return 'example3';
  }

  String example5() => 'example4';
}

