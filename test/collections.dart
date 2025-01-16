class Collections {
  /// List, Map, Set

  void listAdd() {
    int age = 25;
    List<int> ageList = [];

    ageList.add(age);
    print('add 1 : $ageList');
    ageList.add(age);
    print('add 2 : $ageList');

    ageList.addAll([1,2,3,4,5]);
    print('add 3 : $ageList');

    ageList.insert(0, 100);
    print('add 4 : $ageList');
  }

  void listRemove() {
    List<String> nameList = [];
    nameList.addAll(['김연아', '홍길동', '유재석', '변백현', '도경수']);

    nameList.removeLast();
    nameList.removeAt(1);
    print('listRemove 1 : $nameList');
    
    nameList.remove('변백현');
    print('listRemove 2 : $nameList');

    nameList.clear();
    print('listRemove 3 : $nameList');
  }

  void listController() {
    List<int> ageList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    print('listController 1 : ${ageList.length}');

    int ageFirst = ageList.first;
    int ageLast = ageList.last;
    print('ageFirst : $ageFirst, ageLast : $ageLast');

    int ageFour = ageList[3];
    print('listController 2 : $ageFour');
  }
}