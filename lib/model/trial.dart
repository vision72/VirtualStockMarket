class Trial{
  static var currentstock = [10,10,10];
  static int userMoney = 20000;
  static int boughtPowerCard1 = 0;
  static int boughtPowerCard2 = 0;
  static var stocks = [0, 0, 0];
  static var setStocks = [[0, 0, 0, 0],[0, 0, 0, 0,],[0, 0, 0, 0],[0, 0, 0, 0,],[0, 0, 0, 0]];
  static var sellingPrice = [[1000,2000,2500],[2500,3500,3000],[2000,1500,2500]];
  static var difference = [[1000, 1000, -500,],[500, -500, 1000,],];
  static bool counterResetPower = false;
  static bool isButtonDisabled = true;
  static bool timerStarted = false;
  static var sold = 0;
}