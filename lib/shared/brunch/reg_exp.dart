class MyRegularExp {

  static RegExp alphanumRegExp = RegExp('^[a-zA-Z0-9]+\$');
  static RegExp priceRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
}