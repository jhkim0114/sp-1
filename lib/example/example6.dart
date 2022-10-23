class Example6 {

  /// 기본 연산자
  void main() {

    /// ~/
    int i1 = 55 ~/ 2; //몫: 27
    int i2 = 55 % 2; //나머지: 1
    double d = 55 / 2; //27.5

    /// as
    dynamic age = 0; //int
    // age = age as double;  //error
    age = age as num; //int -> num

    /// is
    var size = 10;
    print(size is int);    //true
    print(size is num);    //true
    print(size is String); //false
    print(size is! num);   //false

  }

}