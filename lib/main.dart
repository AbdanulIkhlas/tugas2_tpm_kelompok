import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //buang wm debug
      title: 'Tugas TPM 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  loginMenu createState() => loginMenu();
}

class loginMenu extends State<loginPage> {
  // Pindah menu setelah klik login
  void _goToHomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  // Untuk akses nilai inputan
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LOGIN MENU",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('TPM2',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.teal,
                      fontWeight: FontWeight.w500)),
              Icon(Icons.join_full, size: 100),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Penambahan padding sumbu x
                child: TextField(
                  controller: userC,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Penambahan padding sumbu x
                child: TextField(
                  controller: passC,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (userC.text == 'admin' && passC.text == '123') {
                    _goToHomePage(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Incorrect username or password.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DataKelompok(),
    const AddSubtractPage(),
    OddEvenPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Data Kelompok',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add/Subtract',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer_sharp),
            label: 'Odd/Even',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AddSubtractPage extends StatefulWidget {
  const AddSubtractPage({super.key});

  @override
  _AddSubtractPageState createState() => _AddSubtractPageState();
}

class _AddSubtractPageState extends State<AddSubtractPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  int _result = 0;

  void _calculateResult() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);

    setState(() {
      _result = num1 + num2;
    });
  }

  void _calculateSubtractResult() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);

    setState(() {
      _result = num1 - num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Subtract",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(
                labelText: "Number 1",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(
                labelText: "Number 2",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _calculateResult,
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: _calculateSubtractResult,
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Result: $_result",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------- KLAZ -----------------------------------------
class DataKelompok extends StatelessWidget {
  final List<Map<String, dynamic>> people = [
    {
      'name': 'Muhammad Abdanul Ikhlas',
      'age': '123210009',
      'picture': 'images/ikhlas.png'
    },
    {
      'name': 'Muhammad Harish Wijaya',
      'age': '123210011',
      'picture': 'images/haris.jpeg'
    },
    {
      'name': 'Yoga Agatha Pasaribu',
      'age': '123210025',
      'picture': 'images/yoga.jpeg'
    },
  ];

  DataKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kelompok",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(people[index]['picture']),
                            radius: 30,
                          ),
                          SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                people[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'NIM: ${people[index]['age']}',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _checkOddEven() {
    int number = int.tryParse(_numberController.text) ?? 0;

    setState(() {
      _result = (number % 2 == 0) ? 'Even' : 'Odd';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odd/Even",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: "Enter a number",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _checkOddEven,
              child: const Text("Check Odd/Even"),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Result: $_result",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
