import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:theme_boilerplate_code/Helper/ThemeType.dart';

class ThemeSelector extends StatefulWidget {
  @override
  _ThemeSelectorState createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Selector",),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
              margin: EdgeInsets.all(20),
              shadowColor: Colors.black,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: AutoSizeText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                  style: Theme.of(context).textTheme.headline6,
                  maxLines: 8,
                ),
              )),
          //SizedBox(height: 20,),
          Card(
            margin: EdgeInsets.all(20),
            shadowColor: Colors.black,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(20),
              child:Column(
                children: [
                  Padding(padding: EdgeInsets.all(5),
                  child:AutoSizeText("Please choose the theme",style: Theme.of(context).textTheme.headline6,
                    maxLines: 1,maxFontSize: 100,),),

                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    itemHeight: 50,
                    value: Provider.of<ThemeModel>(
                      context,
                      listen: false,
                    ).getTheme(),
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: GoogleFonts.oswald(color: Theme.of(context).accentColor),
                    underline: Container(
                      height: 2,
                      color: Theme.of(context).accentColor,
                    ),
                    onChanged: (String newValue) {
                      Provider.of<ThemeModel>(
                        context,
                        listen: false,
                      ).setTheme(newValue);
                    },
                    items: <String>[
                      'Light',
                      'Dark',
                      'LightOswald',
                      'DarkOswald',
                      'LightTeko',
                      'DarkTeko'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

        ],
      )),
    );
  }
}
