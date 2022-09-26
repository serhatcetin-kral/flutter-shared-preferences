import 'package:flutter/material.dart';
import './theme_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<ThemeColorData>(create: (BuildContext context)=>ThemeColorData(),
child: MyApp()));



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeColorData>(context).themeColor,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Tema Seçimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Provider.of<ThemeColorData>(context).isGreen?Text("Yeşil Tema"):Text("red theme"),
              onChanged: (_){//parantez icine _ yazdigin zaman parametreyi kullnmak zorunda degilsin
                Provider.of<ThemeColorData>(context,listen: false).toggleTheme();



              },
              value: Provider.of<ThemeColorData>(context).isGreen,
            ),
            Card(
              child: ListTile(
                title: Text("Yapılacaklar"),
                trailing: Icon(Icons.check_box),
              ),
            ),
            SizedBox(height: 8.0),
            RaisedButton(
              child: Text("Ekle"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
