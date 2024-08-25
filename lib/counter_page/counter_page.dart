import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_listerner_and_builder/counter_bloc.dart';
import 'package:flutter_bloc_listerner_and_builder/counter_event.dart';
import 'package:flutter_bloc_listerner_and_builder/counter_state.dart';

class CounterPage extends StatelessWidget {
  // const CounterPage({super.key});

  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app using bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocConsumer<CounterBloc,CounterState>(
                builder: (context, state) {
                  if (state is CounterInitialState) {
                    return Text(
                      state.count.toString(),
                      style: textStyle(),
                    );
                  } else if (state is CounterIncrementState) {
                    return Text(
                      state.incCount.toString(),
                      style: textStyle(),
                    );
                  } else if (state is CounterDecrementState) {
                    return Text(
                      state.decCount.toString(),
                      style: textStyle(),
                    );
                  } else {
                    return Container();
                  }
                },
                listener: (context,state){

                  if(state is CounterIncrementState){

                    if(state.incCount==5){
                      var snack=SnackBar(content: Text("Increment button tap"));
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    }

                  }else if(state is CounterDecrementState){
                    var snack=SnackBar(content: Text("Decrement button tap"));
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  }

                },),

            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent(incCount: counter++));
                    },
                    child: Text(
                      "+",
                      style: textStyle(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(CounterDecrementEvent(decCount: counter--));
                    },
                    child: Text(
                      "-",
                      style: textStyle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


textStyle(){
  return const TextStyle(color: Colors.black,fontSize: 32);
}
