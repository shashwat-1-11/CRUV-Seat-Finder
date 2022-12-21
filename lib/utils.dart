//File Containing all the utility functions to generate UI for the app

import 'package:flutter/material.dart';
import 'constants.dart';

//Function to generate a single seat of the train
Container getSeat (int seatNo, String seatType, bool textDown){
  bool highlightSeat = false;
  if(userEnteredSeatNo == seatNo && userSearched) highlightSeat = true;
  if(seatNo % 8 == 0) seatType = 'SIDE UPPER';
  return Container(
      decoration: BoxDecoration(
        color: highlightSeat ? selectedBoxColor : lightBoxColor,
      ),
      padding: textDown ? EdgeInsets.fromLTRB(10,15,10,5) : EdgeInsets.fromLTRB(10,5,10,15),
      margin: EdgeInsets.symmetric(horizontal: 1),

      child: textDown ? Column(
        children: [
          Text('$seatNo',
              style: TextStyle(color: highlightSeat ? Colors.white : darkedbaseColor, fontSize: 22)
          ),
          Text(seatType,
              style: TextStyle(color: highlightSeat ? Colors.white : darkedbaseColor, fontSize: 12)
          )
        ],
      ) : Column(
        children: [
          Text(seatType,
              style: TextStyle(color: highlightSeat ? Colors.white : darkedbaseColor, fontSize: 12)
          ),
          Text('$seatNo',
              style: TextStyle(color: highlightSeat ? Colors.white : darkedbaseColor, fontSize: 22)
          ),
        ],
      )
  );
}

//Function to generate whole row of seats including the side seat
Row getRowOfSeats (int startSeat, int endSeat, bool textDown){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: seatBorderStyle(textDown),
        child: Row(
          crossAxisAlignment: textDown ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(width: 6, height: 30, color: baseColor),
            getSeat(startSeat, 'LOWER', textDown),
            getSeat(startSeat + 1, 'MIDDLE', textDown),
            getSeat(startSeat + 2, 'UPPER', textDown),
            Container(width: 6, height: 30, color: baseColor)
          ],
        ),
      ),
      Container(
        decoration: seatBorderStyle(textDown),
        child: Row(
          crossAxisAlignment: textDown ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(width: 6, height: 30, color: baseColor),
            getSeat(endSeat, 'SIDE LOWER', textDown),
            Container(width: 6, height: 30, color: baseColor)
          ],
        ),
      )
    ],
  );
}

//Function to generate complete compartment of the train containing 8 seats
Column getCompartment (int startNum, int endNum){
  return Column(
    children: [
      getRowOfSeats(startNum, endNum - 1, true),
      SizedBox(height: 35),
      getRowOfSeats(startNum + 3, endNum, false),
    ],
  );
}

//Function to generate AlertBox in case user enters invalid credentials
Widget buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Text('Invalid Credentials!'),
    content: Text('Please enter a valid seat number which is between 1 - 64.'),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.all(10),
            child: Text('Close', style: TextStyle(color: darkedbaseColor, fontSize: 15))
        ),
      ),
    ],
  );
}