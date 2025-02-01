import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internee.pk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarExpanded = true;

  late PageController _pageController;
  Timer? _timer;
  final List<Map<String, dynamic>> socialMediaLinks = [
    {
      'platform': 'WhatsApp',
      'icon': Icons.message,
      'color': Color(0xFF25D366),
  //    'url': 'https://wa.me/your_whatsapp_number', // Replace with your WhatsApp link
    },
    {
      'platform': 'Instagram',
      'icon': Icons.camera_alt,
      'color': Color(0xFFE4405F),
    //  'url': 'https://www.instagram.com/your_instagram_username', // Replace with your Instagram link
    },
    {
      'platform': 'LinkedIn',
      'icon': Icons.work,
      'color': Color(0xFF0077B5),
      //'url': 'https://www.linkedin.com/in/your_linkedin_username', // Replace with your LinkedIn link
    },
    {
      'platform': 'Facebook',
      'icon': Icons.facebook,
      'color': Color(0xFF1877F2),
      //'url': 'https://www.facebook.com/your_facebook_username', // Replace with your Facebook link
    },
  ];

  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Flutter Development',
      'icon': Icons.code,
      'color': Colors.blue,
      'description': 'Learn to build beautiful apps with Flutter.',
    },
    {
      'title': 'Web Development',
      'icon': Icons.web,
      'color': Colors.green,
      'description': 'Become a web developer with HTML, CSS, and JavaScript.',
    },
    {
      'title': 'Data Science',
      'icon': Icons.bar_chart,
      'color': Colors.orange,
      'description': 'Analyze data and gain insights with Python.',
    },
    {
      'title': 'Machine Learning',
      'icon': Icons.memory,
      'color': Colors.red,
      'description': 'Build intelligent systems with machine learning.',
    },
    {
      'title': 'Cyber Security',
      'icon': Icons.security,
      'color': Colors.purple,
      'description': 'Learn to protect systems and networks.',
    },
    {
      'title': 'Blockchain',
      'icon': Icons.block,
      'color': Colors.teal,
      'description': 'Understand the technology behind cryptocurrencies.',
    },
    {
      'title': 'Cloud Computing',
      'icon': Icons.cloud,
      'color': Colors.indigo,
      'description': 'Master cloud services and deployments.',
    },
    {
      'title': 'DevOps',
      'icon': Icons.autorenew,
      'color': Colors.brown,
      'description': 'Integrate and deliver software continuously.',
    },
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    print('Initializing controllers...');

    // Initialize the PageController
    _pageController = PageController(viewportFraction: 0.8);

    // Set up a timer to auto scroll the pages
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < socialMediaLinks.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    // Add listener to the ScrollController
    _scrollController.addListener(() {
      setState(() {
        _isAppBarExpanded = _scrollController.offset <= 100;
      });
    });
  }

  @override
  void dispose() {
    print('Disposing controllers...');
    _timer?.cancel();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // void _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _isAppBarExpanded ? Colors.transparent : Color(0xFF2C3E50).withOpacity(0.9),
        elevation: _isAppBarExpanded ? 0 : 4,
        title: AnimatedOpacity(
          opacity: _isAppBarExpanded ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: Text(
            'Internee.pk',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white, size: 26),
            onPressed: () {},
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF2C3E50),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF34495E),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/you.jpg'),
                ),
                accountName: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Msaeed-cyber',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2025-01-30 18:42:48',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                accountEmail: null,
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.book, color: Colors.white),
                title: Text(
                  'My Courses',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.notification_important, color: Colors.white),
                title: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                trailing: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.explore, color: Colors.white),
                title: Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(height: 1, color: Colors.white54),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red.shade300),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo_bg.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  // Social Media Carousel
                  Container(
                    height: 100,
                    child: PageView.builder(
                      itemCount: socialMediaLinks.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // onTap: () => _launchURL(socialMediaLinks[index]['url']),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: socialMediaLinks[index]['color'],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    socialMediaLinks[index]['icon'],
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    socialMediaLinks[index]['platform'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  // Start Your Tech Journey Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C3E50).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Your Tech Journey',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Learn from industry experts',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return CourseCard(
                      title: courses[index]['title'],
                      icon: courses[index]['icon'],
                      color: courses[index]['color'],
                      description: courses[index]['description'],
                    );
                  },
                  childCount: courses.length,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3498DB),
        child: Icon(Icons.message, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  const CourseCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.9),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: color,
                ),
                SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}