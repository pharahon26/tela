import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/profile/profileViewModel.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('profile Tela'))
      ),
    );
  }
}
