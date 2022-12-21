//File containing custom design of various UI elements along with the required variables

import 'package:flutter/material.dart';

int userEnteredSeatNo = -1;
bool userSearched = false;

Color baseColor = Color(0xff91C9FF);
Color darkedbaseColor = Color(0xff2F6AC3);
Color lightBoxColor = Color(0xffD3E9FF);
Color selectedBoxColor = Color(0xff2493FE);

TextStyle headText = TextStyle(color: baseColor, fontSize: 30, fontWeight: FontWeight.w900);

//Styled border for the search bar
OutlineInputBorder searchBarBorder = OutlineInputBorder(
    borderSide: BorderSide(
        width: 3, color: baseColor
    ),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10)
    )
);

InputDecoration searchbarDecoration = InputDecoration(
    enabledBorder: searchBarBorder,
    focusedBorder: searchBarBorder,
    hintStyle: TextStyle(color: baseColor),
    hintText: 'Enter Seat Number..'
);

//Styling of the find button
ButtonStyle searchbtnStyle (){
    return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)
            )
        ),
        backgroundColor: baseColor
    );
}
//Styled top/down borders for the row of seats
BoxDecoration seatBorderStyle (bool textDown){
    return BoxDecoration(
        border: textDown ? Border(
            top: BorderSide(width: 6, color: baseColor)
        ) : Border(
            bottom: BorderSide(width: 6, color: baseColor)
        )
    );
}