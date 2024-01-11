void main() {
  CyberMissions cm = CyberMissions();
  // cm.language();
  // cm.systemLanguage();
  //cm.cloud();
  // cm.others();

  // we can also use like this

  cm
    ..language()
    ..systemLanguage()
    ..cloud()
    ..others();
}

//in dart null shell you cant multiple inheritance
//but you can use mixins
//Mixins are a way of defining code that can be reused in
// multiple class hierarchies. They are intended to provide member implementations en masse.
//Mixins and mixin classes cannot have an extends clause, and must not declare any generative constructors.

mixin Cloud {
  void cloud() => print("may be azure?");
}

mixin Language {
  // Language() {
  //   print("you need to learn japanese");
  // } default constructor write htr yin with so tae keyword nae multiple inheritance ko ma ya say par buu

  void language() => print("you have to learn japanese");
}

mixin SystemLanguage {
  void systemLanguage() => print(
      "you need to know php,laravel, ruby, rubyonrails, dart, flutter, docker, git lab... ");
}

mixin Others {
  void others() => print("ask someone else");
}

// class CyberMissions extends Language, SystemLanguage, Others{} // di lo inheritance lote yin ma ya pr buu dart mar

class CyberMissions with Language, SystemLanguage, Others, Cloud {}
