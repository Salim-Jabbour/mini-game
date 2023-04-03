import 'package:flutter/material.dart';
import 'package:isa_hw/structure/structure.dart';
import '../widgets/line.dart';

class UIPage extends StatefulWidget {
  const UIPage({super.key});

  @override
  State<UIPage> createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  // getting only one object and send it to other widgets
  Structure st = Structure();

  // this function to rebuild parent widget
  // because when you press setState inside block class only the child widget will reRender
  // so if u press setState in parent widget it will reRender all of the child
  // and it will reRender itSelf
  void reBuild() {
    setState(() {});
  }

  // @override
  // void initState() {
  //   super.initState();
  //   print(st.getNextState(st));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      // backgroundColor: Colors.white70,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //sending the exact same object

                    //1
                    Line(0, st, update: reBuild),

                    //2
                    Line(1, st, update: reBuild),

                    //3
                    Line(2, st, update: reBuild),

                    //4
                    Line(3, st, update: reBuild),

                    //5
                    Line(4, st, update: reBuild),

                    //6
                    Line(5, st, update: reBuild),

                    //7
                    Line(6, st, update: reBuild),

                    //8
                    Line(7, st, update: reBuild),

                    //9
                    Line(8, st, update: reBuild),

                    //10
                    Line(9, st, update: reBuild),

                    //line for decoraiton
                    Container(
                      color: Colors.green,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'OutPut:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff00ADB5),
                          ),
                        ),
                        //to make the restart button appear
                        IconButton(
                          onPressed: () {
                            setState(() {
                              st = Structure();
                            });
                          },
                          icon: const Icon(
                            Icons.restart_alt_outlined,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              st.outPut = st.gameArray.toString();
                              // st.printArray();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff00ADB5)),
                          child: const Text('Array'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black38,
                  ),
                  Text(
                    st.outPut,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xff00ADB5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
