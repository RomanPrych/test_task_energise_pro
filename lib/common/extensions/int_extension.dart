extension DisplayDigits on int? {
  int get data => this ?? 0;

  String get asTime => data < 10 ? '0$data' : '$data';
}
