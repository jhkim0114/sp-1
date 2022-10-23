class Example7 {

  /// null-aware 연산자
  void main() {

    /// A.?B
    String? name;
    // print(name.length);	//error
    print(name?.length);	//null ?.로 처리해 주면 에러가 나지 않음

    /// A ?? B
    int? age = 7;
    int myAge = age ?? 14;
    print(myAge);   //age가 null이 아니므로 7

    /// A ??= B
    int size = 7;
    int? mySize;
    mySize ??= size;
    print(mySize);  //mySize가 null이므로 7
  }

}