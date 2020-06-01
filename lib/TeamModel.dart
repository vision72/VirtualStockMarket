class Team {
  int _id, _pwr1, _pwr2, _money, _roundnum;
  String _name, _code;

  Team(this._name, this._code, this._pwr1, this._pwr2, this._money, this._roundnum);

  Team.withId(
      this._id, this._name, this._code, this._pwr1, this._pwr2, this._money, this._roundnum);

  get roundnum => _roundnum;

  set roundnum(value) {
    _roundnum = value;
  }

  get code => _code;

  set code(value) {
    _code = value;
  }

  get pwr1 => _pwr1;

  set pwr1(value) {
    _pwr1 = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
//    map['id'] = _id;
    map['teamname'] = _name;
    map['teamcode'] = _code;
    map['powercard1'] = _pwr1;
    map['powercard2'] = _pwr2;
    map['powercard2'] = _pwr2;
    map['roundnumber'] = _roundnum;
    map['money'] = _money;
    return map;
  }

  get pwr2 => _pwr2;

  set pwr2(value) {
    _pwr2 = value;
  }

  get money => _money;

  set money(value) {
    _money = value;
  }
}
