import 'package:flutter/material.dart';
import 'package:portfolio/bloc/localization_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropDownMenu extends StatefulWidget {
  const LanguageDropDownMenu({Key? key}) : super(key: key);

  @override
  _LanguageDropDownMenuState createState() => _LanguageDropDownMenuState();
}

class _LanguageDropDownMenuState extends State<LanguageDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: 'zh_tw',
      icon: Icon(Icons.ac_unit),
      onChanged: (value) {},
      items: [
        DropdownMenuItem(
          value: 'en_us',
          onTap: () => context
              .read<LocalizationBloc>()
              .add(ChangeLocale(Locale('en', 'US'))),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: 'zh_tw',
          onTap: () => context
              .read<LocalizationBloc>()
              .add(ChangeLocale(Locale('zh', 'TW'))),
          child: Text('tw'),
        ),
        DropdownMenuItem(
          value: 'zh_cn',
          onTap: () => context
              .read<LocalizationBloc>()
              .add(ChangeLocale(Locale('zh', 'CN'))),
          child: Text('cn'),
        ),
      ],
    );
  }
}
