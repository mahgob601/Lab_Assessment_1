import 'package:flutter/material.dart';
List<String> CurrencyA = ["EGP","USD","EUR"];
List<String> CurrencyB = ["EGP","USD","EUR"];


double result = 0;
String res = '';
double thisValue = 1;
double myvalue = 0;
String myvalue1 = CurrencyA.first;
String myValue2 = CurrencyB.first;
Map<String, String> flags =
{
  "EGP": "assets/images/egypt.jpg",
  "EUR": "assets/images/euro.png",
  "USD": "assets/images/us.png",
};

void main() {
  runApp(ExchangeApp());
}



class ExchangeApp extends StatefulWidget {
  const ExchangeApp({super.key});

  @override
  State<ExchangeApp> createState() => _ExchangeAppState();
}

class _ExchangeAppState extends State<ExchangeApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:
        Scaffold(
          backgroundColor: Colors.orangeAccent,
          appBar:
          AppBar(
            title: Text(
              "Change your currency today !",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange,

          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                DropdownButton(
                    value: myvalue1,
                    items: CurrencyA.map((String Value) {
                      return DropdownMenuItem(
                        value: Value,
                        child: Text(Value
                        ),

                      );
                    }).toList(),
                    onChanged: (String? Value) {
                      setState(() {
                        myvalue1 = Value!;
                      });
                    }),

                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter the value",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String Val){
                      setState(() {
                        thisValue = double.parse(Val);
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      value: myValue2,
                        items: CurrencyB.map((String Value) {
                          return DropdownMenuItem(
                            value: Value,
                              child: Text(Value),


                          );

                        }).toList(),
                        onChanged: (String? Value){
                          setState(() {
                            myValue2 = Value!;
                          });
                        }),

                  ]
                  ),
                IconButton(
                  icon: Icon(Icons.calculate_rounded),
                  onPressed: ()
                  {
                    setState(() {
                      myvalue = Calculate();
                      print("$myvalue is $thisValue from $myvalue1 to $myValue2 ");
                    });

                  },
                ),
                Container(
                  //child: Text,
                  child:Text(
                    "$myvalue"

                  ),

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(flags[myvalue1]!),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(flags[myValue2]!),
                    )

                  ],
                )

              ],
            ),
          ),

        )

    );
  }
  double Calculate()
  {
    if(myvalue1 == "EGP")
    {
      if(myValue2 == "EGP")
      {
        myvalue = thisValue;
      }
      else if(myValue2 == "USD")
      {
        print("da5alt");
        myvalue = thisValue/40;
        print("out");
      }
      else if(myValue2 == "EUR")
      {
        print("hennaa");
        myvalue = thisValue/35;
        print("lollll");
      }
    }
    else if(myvalue1 == "USD")
    {
      if (myValue2 == "EGP") {
        myvalue = thisValue * 40;
      }
      else if (myValue2 == "USD") {
        myvalue = thisValue;
      }
      else {
        myvalue = thisValue * 2;
      }
    }
    else if(myvalue1 == "USD")
    {
      if(myValue2 == "EGP")
      {
        myvalue = thisValue * 40;
      }
      else if(myValue2 == "USD")
      {
        myvalue = thisValue;
      }
      else
      {
        myvalue = thisValue * 2;
      }
    }
    else if(myvalue1 == "EUR") {
      if (myValue2 == "EGP") {
        myvalue = thisValue * 35;
      }
      else if (myValue2 == "USD") {
        myvalue = thisValue / 2;
      }
      else {
        myvalue = thisValue;
      }
    }
    res = myvalue.toString();
    return myvalue;
  }
}
