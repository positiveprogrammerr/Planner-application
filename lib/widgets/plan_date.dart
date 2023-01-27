import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlanDate extends StatelessWidget {
  final Function dateFunction;
  final DateTime dateTime;
  final Function() previus;
  final Function() next;
  PlanDate(this.dateFunction,this.dateTime,this.previus,this.next);
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: previus,
          icon: Icon(Icons.arrow_left,size: 37,),
        ),
        TextButton(
          onPressed: () {
            dateFunction(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                fontSize: 20,color: Colors.black
              ),
              children: [
              TextSpan(
                text: '${DateFormat.EEEE().format(dateTime)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '${DateFormat(" d MMM").format(dateTime)}',
              ),
            ]),
          ),
        ),
        IconButton(
          onPressed: next,
          icon: Icon(Icons.arrow_right,size:37),
        ),
      ],
    );
  }
}
