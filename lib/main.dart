import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List to store all operator
  List<String> _operator = ['+', '-', '*', '/'];    
  String _currentItemSelected = '+';    //'+' operator will be chosen at the start
  final TextEditingController _aNumerator = TextEditingController();    //numerator1  
  final TextEditingController _bDenominator = TextEditingController();    //denominator1
  final TextEditingController _cNumerator = TextEditingController();    //numerator2
  final TextEditingController _dDenominator = TextEditingController();    //denominator2
  double nume1 = 0.0, deno1 = 0.0, nume2 = 0.0, deno2 = 0.0, nume3 = 0.0, deno3 = 0.0, result = 0.0;
  String img = "assets/fraction.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,    //to prevent bottom overload
        backgroundColor: Colors.indigoAccent,   //apps background colour
        appBar: AppBar(
          title: Text('Fraction Calculator'),
          backgroundColor: Colors.indigo,   //appbar background colour
          centerTitle: true,    //make appbar title center
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
            //image widget 
            Image.asset(img, height: 140.0, fit: BoxFit.cover),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Numerator 1",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.redAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _aNumerator,
                    ),
                  ), 
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Numerator 2",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.redAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _cNumerator,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('______________________'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('______________________'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Denominator 1",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.redAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _bDenominator,
                    ),
                  ), 
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Denominator 2",
                        contentPadding: EdgeInsets.all(10),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.redAccent,
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      style: TextStyle(fontSize: 20.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: _dDenominator,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 30),
                child: Text("Choose Operator:",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 50, 30),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      //Drop Down Button widget to choose operators
                      child: DropdownButton<String>(
                        items: _operator.map((String dropdownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropdownStringItem,
                            child: Text(dropdownStringItem,
                            style: TextStyle(fontSize: 20.0,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }).toList(),

                        onChanged: (String newValueSelected){
                          // your code to execute, when a menu item is selected from drop down
                          _onDropDownSelectedItem(newValueSelected);  
                        },
                        value: _currentItemSelected,    //select + operator at start
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Padding(
                  padding: EdgeInsets.all(5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 150.0,
                      height: 50,
                      color: Colors.redAccent,
                      splashColor: Colors.indigoAccent,   //make button splash when user clicked
                    child: Text("=",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _onPressed,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 150.0,
                      height: 50,
                      color: Colors.redAccent,
                      splashColor: Colors.indigoAccent,   //make button splash when user clicked
                    child: Text("Reset",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _reset,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text("Result:",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text("$nume3",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text("______________",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Text("$deno3",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  //Calculation process based on chosen operator
  void _onPressed(){
    setState((){
      nume1 = double.parse(_aNumerator.text);
      deno1 = double.parse(_bDenominator.text);
      nume2 = double.parse(_cNumerator.text);
      deno2 = double.parse(_dDenominator.text);
      if (_currentItemSelected == '+'){  
        deno3 = gcd(deno1, deno2);
        nume3 = (nume1 * deno2) + (deno1 * nume2);
        deno3 = deno1 * deno2;
      }
      else if (_currentItemSelected == '-'){
        deno3 = gcd(deno1, deno2);
        nume3 = (nume1 * deno2) - (deno1 * nume2);
        deno3 = deno1 * deno2;
      }
      else if (_currentItemSelected == '*'){
        deno3 = gcd(deno1, deno2);
        nume3 = nume1 * nume2;
        deno3 = deno1 * deno2;
      }
      else if (_currentItemSelected == '/'){
        deno3 = gcd(deno1, deno2);
        nume3 = nume1 * deno2;
        deno3 = deno1 * nume2;
      }
      simplestform();
    });
  }
  
  //Greatest Common Divisor (gcd). Fractions can be reduced if the numerator and denominator have a gcd greater than 1.
  double gcd(double a, double b){
    if (a == 0){
      return b;
    }
    else{
      return gcd(b % a, a);
    }
  }

  //Function to convert the obtained fraction into it's simple form
  void simplestform(){
    double commonFactor = gcd(nume3, deno3);
    deno3 = deno3 / commonFactor;
    nume3 = nume3 / commonFactor;
  }

  //Reset all the text field and result text
  void _reset(){
    setState(() {
      _aNumerator.text = "";
      _bDenominator.text = "";
      _cNumerator.text = "";
      _dDenominator.text = "";
      nume3 = 0.0;
      deno3 = 0.0;
    });
  }

  //Function to call the value (operator) selected by user
  void _onDropDownSelectedItem(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}