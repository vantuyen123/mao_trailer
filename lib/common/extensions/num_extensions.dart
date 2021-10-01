extension NumExtension on num{
  String convertPercentageString(){
    return ((this) * 10).toStringAsFixed(0) + ' %';
  }
}