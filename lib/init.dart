class Init {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    //TODO register services
    print("starting registering services");
    await Future.delayed(Duration(seconds: 5));
    print("finished registering services");
  }

  static _loadSettings() async {
    print("starting loading settings");
    await Future.delayed(Duration(seconds: 3));
    print("finished loading settings");
    //TODO load settings
  }
}
