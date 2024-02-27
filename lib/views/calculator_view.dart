import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});
 

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  
  int x=0;
  int y=0;
  num z=0;

  final displayOneController=TextEditingController();
  final displayTwoController=TextEditingController();

   //late final AppLifecycleListener _listener;

  @override
  void initState() {
    // TODO: implement initState
    displayOneController.text=x.toString();
    displayTwoController.text=y.toString();

    // _listener=AppLifecycleListener(
    //   onShow: _onShow,
    //   onHide: _onHide,
    //   onResume: _onResume,
    //   onDetach: _onDetach,
    //   onPause: _onPause,
    //   onInactive: _onInactive,
    //   onRestart: _onRestart,

    // ),
      }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          //calculator display
          DisplayOne(hint: "Enter First Number", controller: displayOneController),
          const SizedBox(height: 30,),
          DisplayOne(hint: "Enter Second Number", controller: displayTwoController),
          const SizedBox(height: 30,),
          Text(
            z.toString(),
            style:const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),    //spacer is used for flexible space
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              FloatingActionButton(onPressed: () {
                setState(() {
                   z= num.tryParse(displayOneController.text)! +
                      num.tryParse(displayTwoController.text)!;
                });
                
              },
              child: const Icon(Icons.add),),

              FloatingActionButton(onPressed: () {
                 setState(() {
                   z= num.tryParse(displayOneController.text)! -
                      num.tryParse(displayTwoController.text)!;
                });
              },
              child: const Icon(CupertinoIcons.minus),),

              FloatingActionButton(onPressed: () {
                 setState(() {
                   z= num.tryParse(displayOneController.text)! *
                      num.tryParse(displayTwoController.text)!;
                });
              },
              child: const Icon(CupertinoIcons.multiply),),

              FloatingActionButton(onPressed: () {
                 setState(() {
                   z= num.tryParse(displayOneController.text)! /
                      num.tryParse(displayTwoController.text)!;
                });
              },
              child: const Icon(CupertinoIcons.divide),),
            ]
          ),
          const SizedBox(
              height:10 ,
          ),
          FloatingActionButton.extended(
            onPressed: (){
              setState(() {
                x=0;
                y=0;
                z=0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: const Text("Clear"),
            )
          //Expand
          //Calculator button
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({
    super.key, this.hint="Enter a number",required this.controller
  });

  final String? hint;
  final TextEditingController controller; //TextEditingController stores and manages the text we write in the textfield

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: hint,
        hintStyle:const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
