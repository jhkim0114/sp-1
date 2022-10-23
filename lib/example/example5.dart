class Example5 {

  /// const vs final
  void main() {
    /// const는 compile-time constant로 앱 빌드시 값이 정해진다.
    /// 앱의 라이프 사이클에서 절대 변하지 않음을 의미
    /// 불변 변수의 앞에 'const'를 붙여 주면 플러터가 그 부분을 리빌드하지 않기 때문에,
    /// 앱의 속도가 빨라진다. (성능 개선)
    const name = '쫄랑이';

    /// final은 run-time constant로서 앱 빌드시에는 값이 정해지지 않지만 앱 실행시 값이 정해진다.
    /// (e.g. DateTime.now, Device size 등)
    final time = DateTime.now();
  }

}