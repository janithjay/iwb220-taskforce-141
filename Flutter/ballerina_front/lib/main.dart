import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import this at the top of your file


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  
bool isEnglish = true; // Track the current language
   

  // ↓ Add the code below.
  var favorites = <WordPair>[];

  void toggleLanguage() {
    isEnglish = !isEnglish; // Toggle language
    notifyListeners();
  }

  String get mainTopic => isEnglish ? 'BDSM.LK' : 'BDSM.LK (Translated)';
  String get subTopic => isEnglish ? 'Express way Bus Companion App' : 'අධිවේගී මාර්ග බස් සේවා යෙදුම'; // Example translation

  // Method to get localized labels
  String getLocalizedLabel(String englishLabel, String translatedLabel) {
    return isEnglish ? englishLabel : translatedLabel;
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: 275, // Set this height to cover the desired area
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.jpg'),
                fit: BoxFit.cover, // Cover the container area
              ),
            ),
          ),
          // Main content on top of the image
          Container(
            color: Colors.black.withOpacity(0.0), // Semi-transparent background
            child: Column(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: MainTopic()),
                          LanguageChangeButton(),
                        ],
                      ),
                      SubTopic(appState.subTopic),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DateTimeDisplay(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Black area below the image
          Positioned(
            top: 275, // Same height as the image
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black, // Full black color below the image
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row
                    children: [
                      MenueButton(
                        backgroundImage: 'assets/news1.jpg',
                        icon: Icons.newspaper,
                        englishLabel: 'Main News Feed', 
                        translatedLabel: 'ප්‍රධාන පුවත්',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainNewsPage()),
                          );
                        },
                      ), // First button
                      SizedBox(width: 20), // Space between the buttons
                      MenueButton(
                        backgroundImage: 'assets/redar.jpg',
                        icon: Icons.bus_alert,
                        englishLabel: 'Live Bus Alerts',
                        translatedLabel: 'සජීවී බස් තොරතුරු', 
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainNewsPage()),
                          );
                        },
                      ), // Second button
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row
                    children: [
                      MenueButton(
                        backgroundImage: 'assets/track.jpg',
                        icon: Icons.gps_fixed,
                        englishLabel: 'Live Bus Radar',
                        translatedLabel: 'සජීවී බස් රේඩාර් පද්ධතිය',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainNewsPage()),
                          );
                        }, 
                      ), // First button
                      SizedBox(width: 20), // Space between the buttons
                      MenueButton(
                        backgroundImage: 'assets/schedule.jpg',
                        icon: Icons.calendar_month,
                        englishLabel: 'Bus Schedule',
                        translatedLabel: 'බස් කාලසටහන',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainNewsPage()),
                          );
                        }, 
                      ), // Second button
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row
                    children: [
                      MenueButton(
                        backgroundImage: 'assets/ticket.jpg',
                        icon: Icons.money,
                        englishLabel: 'Ticket Prices',
                        translatedLabel: 'ප්‍රවේශපත් මිල ගණන්',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainNewsPage()),
                          );
                        }, 
                      ), // First button
                      SizedBox(width: 20), // Space between the buttons
                      MenueButton(
                        backgroundImage: 'assets/Reserve.jpg',
                        icon: Icons.chair,
                        englishLabel: 'Reserve Seats',
                        translatedLabel: 'ආසන වෙන් කිරීම',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainNewsPage()),
                          );
                        }, 
                      ), // Second button
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class MenueButton extends StatelessWidget {
  final String backgroundImage;
  final IconData icon;
  final String englishLabel; 
  final String translatedLabel;
  final VoidCallback onPressed; // Add this to handle navigation


  const MenueButton({
    Key? key,
    required this.backgroundImage,
    required this.icon,
    required this.englishLabel,
    required this.translatedLabel,
    required this.onPressed, // Add this
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    String label = appState.getLocalizedLabel(englishLabel, translatedLabel); // Get localized label

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Container(
                  width: 175, // Width of the button
                  height: 135, // Height of the button
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(backgroundImage), // Background image
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.85), // Apply opacity
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0), // Add left and bottom padding to label
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 8.0), // Add right and top padding to icon
                          child: Icon(
                            icon, // Your desired icon
                            color: const Color.fromARGB(255, 70, 126, 230),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 0), // Adjust this if you want spacing between buttons
            ],
          ),
        ],
      ),
    );
  }
}

class LanguageChangeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var appState = context.watch<MyAppState>();
    

    IconData icon = Icons.language;
    var label ;

    if (appState.isEnglish ==true) {
      label = 'A';
    } else {
      label = 'අ';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleLanguage();
                },
                icon: Icon(icon),
                label: Text(label),
              ),
              SizedBox(width: 10),
            ],
          ),
          
        ],
      ),
    );
  }
}

class DateTimeDisplay extends StatelessWidget {
  const DateTimeDisplay({super.key});

  String translateDay(int dayOfWeek) {
    const daysInSinhala = [
      'ඉරිදා', // Sunday
      'සඳුදා', // Monday
      'අඟහරුවාදා', // Tuesday
      'බදාදා', // Wednesday
      'බ්‍රහස්පතින්දා', // Thursday
      'සිකුරාදා', // Friday
      'සෙනසුරාදා', // Saturday
    ];
    return daysInSinhala[dayOfWeek];
  }

  String translateAmPm(bool isAM) {
    return isAM ? 'පෙ.ව' : 'ප.ව'; // "පෙ.ව" = AM, "ප.ව" = PM
  }

  String formatTime(DateTime now, bool isEnglish) {
    String formattedTime = DateFormat('hh:mm').format(now);
    String amPm = isEnglish ? (now.hour < 12 ? 'AM' : 'PM') : translateAmPm(now.hour < 12);
    return isEnglish ? '$formattedTime $amPm' : '$amPm $formattedTime'; // Place AM/PM accordingly
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    DateTime now = DateTime.now();

    // Format the date
    String formattedDate = appState.isEnglish
        ? DateFormat('EEEE yyyy.MM.dd').format(now)
        : translateDay(now.weekday) + ' ' + DateFormat('yyyy.MM.dd').format(now);

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
        children: [
          Text(
            formatTime(now, appState.isEnglish),
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Arial',
              color: Colors.white70,
            ),
          ),
          Text(
            formattedDate,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Arial',
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class SubTopic extends StatelessWidget {

  final String text;

  const SubTopic(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
      child:Align(
        alignment: Alignment.centerLeft, // Align to the left
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14, // Change font size
            fontFamily: 'Arial', // Change font family
            color: Colors.white70, // Change text color
        ),
      ),
      )  
    );
  }
}

class MainTopic extends StatelessWidget {
  const MainTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 15.0),
      child: Align(
        alignment: Alignment.centerLeft, // Align to the left
        child: Text(
          'ExpressTrack',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 26, // Change font size
            fontWeight: FontWeight.bold, // Change font weight
            fontFamily: 'Arial', // Change font family
            color: Colors.white70, // Change text color
          ),
        ),
      ),
    );
  }
}




class MainNewsPage extends StatefulWidget {
  @override
  _MainNewsPageState createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
  final TextEditingController startController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  String ticketPrice = '';

  void searchTicketPrice() {
    String start = startController.text;
    String destination = destinationController.text;

    // Mock logic to find the ticket price (replace this with your actual search logic)
    if (start.isNotEmpty && destination.isNotEmpty) {
      setState(() {
        ticketPrice = 'Ticket Price from $start to $destination is \$50'; // Example price
      });
    } else {
      setState(() {
        ticketPrice = 'Please enter both start and destination points.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main News')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add some padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column content
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              // Start Point input box
              TextField(
                controller: startController,
                decoration: InputDecoration(
                  labelText: 'Start Point',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16), // Space between input boxes

              // Destination input box
              TextField(
                controller: destinationController,
                decoration: InputDecoration(
                  labelText: 'Destination',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32), // Space between input box and button

              // Search Button
              ElevatedButton(
                onPressed: searchTicketPrice,
                child: Text('Search Ticket Price'),
              ),

              SizedBox(height: 20), // Space before showing the result

              // Display the ticket price after search
              Text(
                ticketPrice,
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


