import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PlanInfo extends StatelessWidget {
  int len ;
  int numberDone ;
  PlanInfo(this.len,this.numberDone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                len<10?'0${len}':'$len',
                style: TextStyle(fontWeight: FontWeight.w600,fontFamily: GoogleFonts.oxygen().fontFamily),
              ),
              Text(
                'All plans',
                style: TextStyle(fontSize: 11.6, color: Color.fromARGB(255, 8, 41, 67)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                numberDone<10?'0${numberDone}':'$numberDone',
                style: TextStyle(fontWeight: FontWeight.w600,fontFamily: GoogleFonts.oxygen().fontFamily),
              ),
              Text(
                'Completed Plans',
                style: TextStyle(fontSize: 11.6, color: Color.fromARGB(255, 8, 42, 68),fontFamily: GoogleFonts.oxygen().fontFamily),
              ),
            ],
          )
        ],
      ),
    );
  }
}
