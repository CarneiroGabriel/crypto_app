import 'package:crypto_app/currency_provider.dart';
import 'package:crypto_app/widget/currencies_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'Crypto App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => CurrencyProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark(),
      home: MainPage(),
    ),
  );

  MainPage() => Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Container(
      child: CurrenciesWidget(),
    ),
  );


}

