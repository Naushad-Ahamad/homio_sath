import 'package:flutter/material.dart';
import 'package:hica_app/utils/my_theme.dart';

class SearchMadicineBox extends StatefulWidget {
  const SearchMadicineBox({super.key});

  @override
  State<SearchMadicineBox> createState() => _SearchMadicineBoxState();
}

class _SearchMadicineBoxState extends State<SearchMadicineBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Madicine Search',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              )),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyTheme.white, width: 1),
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      new BoxShadow(
                        color: const Color(0xFFF5F3F3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    //  controller: firstnameController,
                    //This will obscure text dynamically
                    decoration: const InputDecoration(
                      hintText: 'Search Madicines',
                      /* icon: ImageIcon(
                  AssetImage('assets/images/wwweb.png'),
                  size: 20,
                  color: Color(0xFFB88231),
                ),*/
                      hintStyle: TextStyle(color: Colors.black45, fontSize: 15),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.restart_alt,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Naproxen',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
