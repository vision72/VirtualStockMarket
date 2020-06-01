class Market {
  final String title;
  final String subtitle;
  final String imageUrl;

  static var currentstock = [15,15,15,15,15];
  static int userMoney = 100000;
  static int powerCard1 = 0;
  static int powerCard2 = 0;
  static int boughtPowerCard1 = 0;
  static int boughtPowerCard2 = 0;
  static var stocks = [0, 0, 0, 0, 0];
  static var setStocks = [[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]];
  static var sellingPrice = [[3000,3300,3500,3650,3350,3300],[2600,2050,1850,2150,2000,1750],[500,700,550,625,525,650],[2000,2200,2050,2200,2250,2350],[800,1040,1140,1400,1150,1300]];
  static int availPowerCard1=1;
  static int availPowerCard2=2;
  static var difference = [[300, -550, 200, 200, 240],[200, -200, -150, -150, 100],[150, 300, 75, 150, 250],[-300, -150, -100, 50, -250],[-50, -250, 125, 100, 150]];
  static bool counterResetPower = false;
  static bool allowPowerCards = true;
  static bool hasPowerCode = false;
  static bool powerCard1Active = false;
  static bool powerCard2Active = false;
  static bool isButtonDisabled = true;
  static bool timerStarted = false;
  static var sold = 0;

  static final List powerCode = [
    "513abc",
    "y832a3",
    "aw2314",
    "va134a",
  ];

  Market({
    this.title,
    this.subtitle,
    this.imageUrl,
  });
}
