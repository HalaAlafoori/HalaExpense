class MyRegularExp {

  static RegExp alphanumRegExp = RegExp(r'^[a-zA-Z0-9\u0600-\u06FF\s]+$');
  static RegExp priceRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
  static RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

}