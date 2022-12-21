import 'package:flutter/material.dart';
import 'constants.dart';
import 'utils.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seat Finder', style: headText),
              SizedBox(height: 25),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: searchbarDecoration,
                          onChanged: (_num){
                            setState(() {
                              userSearched = false;
                              if(_num.length == 0){
                                userEnteredSeatNo = -1;
                              }else{
                                userEnteredSeatNo = int.parse(_num);
                              }
                            });
                          },
                        )
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ElevatedButton(
                            onPressed: userEnteredSeatNo == -1 ? null : (){
                              FocusManager.instance.primaryFocus?.unfocus();
                              if(userEnteredSeatNo == 0 || userEnteredSeatNo > 64){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => buildPopupDialog(context)
                                );
                              }
                              setState(() {
                                userSearched = true;
                              });
                            },
                            child: Text('Find'),
                          style: searchbtnStyle()
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 8,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          for (int i=0;i<8;i++) getCompartment(8*i + 1, 8*(i+1))
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}