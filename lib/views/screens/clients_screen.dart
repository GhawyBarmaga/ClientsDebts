// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/clients_controller.dart';

import '../widget/components.dart';

import 'add_clients.dart';

import 'loginscreen.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "قائمة العملاء ",
          style:
              TextStyle(color: HexColor("444444"), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await FirebaseAuth.instance.currentUser?.delete();

            Get.offAll(() => const LoginScreen());
          },
          icon: const Icon(Icons.logout),
          color: Colors.red,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<AddClientsController>(
          builder: (AddClientsController controller) => SizedBox(
            width: Get.width,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Pharmacists")
                    .where("uid",
                        isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (context, snap) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomForm(
                            // ignore: body_might_complete_normally_nullable
                            onchange: (Value) {
                              //controller.searchClients(Value);
                              controller.searchname.text == Value;
                              controller.update();
                            },
                            text: "البحث عن العملاء   ",
                            type: TextInputType.name,
                            name: controller.searchname,
                            sufxicon: const Icon(Icons.search)),
                      ),
                      // SizedBox(
                      //   height: Get.height * 0.08,
                      // ),
                      Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("Pharmacists")
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .collection("clients")
                                  .orderBy("name")
                                  .startAt([controller.searchname.text]).endAt([
                                "${controller.searchname.text}\uf8ff"
                              ]).snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    backgroundColor: Colors.deepPurple,
                                  ));
                                }
                                if (snapshot.hasData) {
                                  // List<DocumentSnapshot> filteredDocuments =
                                  //     snapshot.data!.docs.where((element) {
                                  //   return element['name']
                                  //       .contains(controller.searchname.text);
                                  // }).toList();
                                  return ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemBuilder: (context, index) => Card(
                                      color: Colors.deepPurple,
                                      elevation: 5,
                                      child: ListTile(
                                        title: Text(
                                          snapshot.data?.docs[index]['name'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "${snapshot.data?.docs[index]['company']} -",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  "${snapshot.data?.docs[index]['guid']} -",
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: snapshot.data?.docs[index]
                                                  ['phone'],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ])),
                                        trailing: Text(
                                          snapshot.data!
                                              .docs[index]['currentAmount']
                                              .toString(),
                                          style: TextStyle(
                                              color: snapshot.data?.docs[index]
                                                          ['currentAmount'] >
                                                      0
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: Text(
                                      "لاتوجد بيانات",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }
                              })),
                    ],
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("191919"),
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(() => const AddClients());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
