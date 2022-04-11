import 'package:flutter/material.dart';
import '../services/networking_service.dart';
import '../utils/user_shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var _status = false;
  // var _statusCode = 0;
  var _status;
  var _statusCode;
  late NetworkingService _networkingService;

  @override
  void initState() {
    super.initState();

    _status = UserSharedPreferences.getStatus() ?? false;
    _statusCode = UserSharedPreferences.getStatusCode() ?? 0;
  }

  Future<dynamic> _notifyStatus(statusCode) async {
    _networkingService = NetworkingService(
        'https://achievexsolutions.in/current_work/eatiano/api/delivery/status/$statusCode');
    var response = await _networkingService.getData();
    print('response from switch: $response');
  }

  _onChanged() async {
    if (_statusCode == 0) {
      setState(() {
        _statusCode = 1;
      });
      await UserSharedPreferences.setStatusCode(_statusCode);
    } else {
      setState(() {
        _statusCode = 0;
      });
      await UserSharedPreferences.setStatusCode(_statusCode);
    }
    setState(() {
      _status = !_status;
    });
    await UserSharedPreferences.setStatus(_status);
    return _statusCode;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: mediaQuery.size.height * 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Hand drawn.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            const Center(
              child: Text(
                'Welcome,Kevin!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.02,
            ),
            buildSwitch(context),
            SizedBox(
              height: mediaQuery.size.height * 0.03,
            ),
            (_statusCode == 1 && _status == true)
                ? Center(
                    child: Text(
                      'Active',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : const Center(
                    child: Text(
                      'Inactive',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget buildSwitch(ctx) {
    return Transform.scale(
      scale: 1.3,
      child: Switch.adaptive(
        activeColor: Theme.of(context).colorScheme.secondary,
        activeTrackColor: Color(0xffd8f3dc),
        inactiveThumbColor: Colors.red,
        inactiveTrackColor: Color(0xfffbb1bd),
        value: _status,
        onChanged: (value) async {
          // setState(() {
          //   _status = !_status;
          // });
          var _statusCode = await _onChanged();
          print(_statusCode);
          _notifyStatus(_statusCode);
        },
      ),
    );
  }
}
