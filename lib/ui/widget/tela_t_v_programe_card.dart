import 'package:flutter/material.dart';
import 'package:mobile/models/programetv.dart';

class TelaTVProgrameCard extends StatelessWidget {
  final TelaProgrammeTV programmeTV;
  const TelaTVProgrameCard({Key? key, required this.programmeTV}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: mq.size.height/3,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF5cdee5), Color(0xFF0451b0)])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(programmeTV.type,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                      color: Colors.white
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(programmeTV.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white
                  )
              ),
            ),

          ]
        ),
      ),
    );
  }
}
