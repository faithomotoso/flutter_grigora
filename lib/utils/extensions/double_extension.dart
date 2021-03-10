extension double_mod on double {
  num formatDouble() {
    // this would display a 1.0 as 1 and 1.x as 1.x
    // if x is > 0
    List<String> splitDouble = this.toString().split(".");
    if (int.parse(splitDouble.last) > 0) return this;
    else return this.toInt();
  }
}