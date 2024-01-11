//async sync so pi shi par tal async ka stream so tae har ko use pi
// iterable ka sync ko use par tal
//different iterable ka normal work twae ko kyar phyat pi run par tal
// stream ka kya taw async await yae nee lan twae ko lite nar lo normal work pi mha lote pr tal

void main()  {
  print("normal work1");

  getNumber().forEach((e) => print(e));
  print("normal work2");
  print("normal work3");
}

Iterable<int> getNumber() sync* {
  for (int i = 0; i >= 6; i++) {
    yield i;
  }
}
