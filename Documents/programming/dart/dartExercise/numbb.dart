class numbb {
  int numb = 2;
  int _kanan = 1;

  /// _ so tae keyword ka private keyword nae tutu par pal private lo lite tae akhar variable twae ko assign direct lote lo ma ya taw pr buu getter
  // setter ka nay thar ya par taw tal

  int get num => _kanan; // getter

  set num(int num) {
    if (num == null) {
      _kanan = 0;
    } else {
      _kanan = num;
    }
  }

  void triple(int value) {
    print(_kanan * value);
  }
}
