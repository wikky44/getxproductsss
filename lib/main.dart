import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxproductsss/Modell/Getapii.dart';
import 'package:getxproductsss/Modell/Phonez.dart';
import 'package:getxproductsss/Modell/Products.dart';


void main() => runApp(GetMaterialApp(home: Home()));


class Home extends StatelessWidget {
  final Phonezcontroller = Get.put(PhonezGetx());

  get userList => null;


  @override
  Widget build(BuildContext context) {
    Phonezcontroller.fetchPhonez();

    return Scaffold(
        appBar: AppBar(title: const Text("cell_Phones")),
        body:
        Obx(
              () {
      return  ListView.builder(
          itemCount: Phonezcontroller.products.length,
          itemBuilder: (context, index) {
            Products p=Phonezcontroller.products[index];
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    padding: const EdgeInsets.only(left: 20),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage('${p.thumbnail}'),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${p.id}'
                            ),
                            Text('${p.title}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18)),
                            Text('${p.brand}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          });
    }));

  }
}

class NextPage extends StatefulWidget {
  late Phonez st;
  NextPage({super.key, required this.st});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Center(
          child:
          Column(
            children:[Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16) ) ,
              Text("${widget.st.limit}"),
              Text("${widget.st.products}"),
              Text("${widget.st.total}"),
              ElevatedButton(
                child: Text("Back page and open snackbar"),
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'User wikky',
                    'Successfully opened',
                  );  },
              ),

            ],
          ),
        ));
  }
}

