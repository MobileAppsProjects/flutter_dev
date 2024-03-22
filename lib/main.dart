import 'package:flutter/material.dart';
import 'package:flutter_dev/src/features/login/screens/auth_page.dart';
import 'package:flutter_dev/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_dev/src/features/root/my_home.dart';
import 'package:get/get.dart';
import './src/utils/theme/theme.dart';
import './src/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: TAppTheme.ligth,
        //darkTheme: TAppTheme.dark,
        themeMode: ThemeMode.system,
        home: MyHomePage());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Demo',
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                height: 50,
                color: TprimaryColor50,
                child: const Center(child: Text('50')),
              ),
              Container(
                height: 50,
                color: TprimaryColor100,
                child: const Center(child: Text('100')),
              ),
              Container(
                height: 50,
                color: TprimaryColor200,
                child: const Center(child: Text('200')),
              ),
              Container(
                height: 50,
                color: TprimaryColor300,
                child: const Center(child: Text('300')),
              ),
              Container(
                height: 50,
                color: TprimaryColor400,
                child: const Center(child: Text('400')),
              ),
              Container(
                height: 50,
                color: TprimaryColor,
                child: const Center(child: Text('500')),
              ),
              Container(
                height: 50,
                color: TprimaryColor600,
                child: const Center(child: Text('700')),
              ),
              Container(
                height: 50,
                color: TprimaryColor700,
                child: const Center(child: Text('800')),
              ),
              Container(
                height: 50,
                color: TprimaryColor800,
                child: const Center(child: Text('900')),
              ),
              Container(
                height: 50,
                color: TprimaryColor900,
                child: const Center(child: Text('950')),
              ),
              Container(
                color: TsecondaryColor,
                height: 50,
                child: const Center(child: Text('Secondary Color')),
              ),
              Container(
                color: TaccentColor,
                height: 50,
                child: const Center(
                  child: Text('Accent Color'),
                ),
              ),
              Text('Text styles'),
              Text('displayLarge',
                  style: Theme.of(context).textTheme.displayLarge),
              Text('displayMedium',
                  style: Theme.of(context).textTheme.displayMedium),
              Text('displaySmall',
                  style: Theme.of(context).textTheme.displaySmall),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Elevated Button')),
            ],
          )),
    );
  }
}
