List<int> lottoNumber() {

  var number = List<int>.generate(45, (i) => ++i);
  number.shuffle();

  print('당첨번호');
  print(number.sublist(0, 6));

  return number.sublist(0, 6);
}

List<int> myNumber() {

  var number2 = List<int>.generate(45, (i) => ++i);
  number2.shuffle();

  print('내 추첨번호');
  print(number2.sublist(0, 6));

  return number2.sublist(0, 6);
}

void checkNumber(List<int> number, List<int> number2) {

  int match = 0;

  for(int lotto in number) {
    for(int myNum in number2) {

      if (lotto == myNum) {

        match++;
        print('당첨번호: $myNum');
      }
      // print('로또번호 = $lotto');
      // print('내 추첨번호 = $myNum');
    }

  }

  print('$match개의 당첨번호가 있습니다!');
}

void main() {

  List<int> lottoFinal = lottoNumber();
  List<int> myFinal = myNumber();

  checkNumber(lottoFinal, myFinal);
}