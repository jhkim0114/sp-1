class Example8 {

  /// parameter
  void main() {

    /// optional parameter
    void introduce1(String name, int age, [String? food]) {
      print('나는야 $name. $age살 입니다!');
      if (food is String) {
        print('$food를 좋아합니다.');
      }
    }
    introduce1('쫄랑이', 7);	//나는야 쫄랑이. 7살 입니다!
    introduce1('쫄랑이', 7, '사과');	//나는야 쫄랑이. 7살 입니다! 나는야 사과를 좋아합니다.

    /// default parameter
    void introduce2(String name, int age, [String food = '사과']) {
      print('나는야 $name. $age살! $food를 좋아합니다!');
    }
    introduce2('쫄랑이', 7); //나는야 쫄랑이. 7살! 사과를 좋아합니다!
    introduce2('쫄랑이', 7, '감자'); //나는야 쫄랑이. 7살! 사과를 좋아합니다!

    /// named parameter
    void introduce3(String name, {required int age, String? food}) {
      print('나는야 $name. $age살!');
      if (food is String) {
        print('$food를 좋아합니다.');
      }
    }
    introduce3('쫄랑이', age: 7);	//나는야 쫄랑이. 7살 입니다.
    introduce3('쫄랑이', age: 7, food: '사과');	//나는야 쫄랑이. 7살 입니다. 사과를 좋아합니다.

  }

}