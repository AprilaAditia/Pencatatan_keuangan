import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencatatan_keuangan2/pages/category_page.dart';
import 'package:pencatatan_keuangan2/pages/home_page.dart';
import 'package:pencatatan_keuangan2/pages/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0
          ? CalendarAppBar(
              accent: Color.fromRGBO(214, 21, 96, 1),
              backButton: false,
              locale: 'id',
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : AppBar(
              title: Text(
                "Categories",
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 1,
            ),
      body: _children[currentIndex],
      floatingActionButton: Visibility(
        visible: currentIndex == 0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                    MaterialPageRoute(builder: (context) => TransactionPage()))
                .then((value) => setState(() {}));
          },
          backgroundColor: const Color.fromRGBO(214, 21, 96, 1),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Color.fromRGBO(214, 21, 96, 1),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Category",
          ),
        ],
      ),
    );
  }
}
