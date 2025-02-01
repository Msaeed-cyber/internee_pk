import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Popular Courses',
      'icon': Icons.trending_up,
      'color': Colors.orange,
      'count': '25+ Courses',
    },
    {
      'title': 'New Arrivals',
      'icon': Icons.new_releases,
      'color': Colors.green,
      'count': '10+ Courses',
    },
    {
      'title': 'Top Rated',
      'icon': Icons.star,
      'color': Colors.purple,
      'count': '15+ Courses',
    },
    {
      'title': 'Certifications',
      'icon': Icons.card_membership,
      'color': Colors.blue,
      'count': '8+ Programs',
    },
  ];

  final List<Map<String, dynamic>> featuredCourses = [
    {
      'title': 'Web Development Bootcamp',
      'instructor': 'John Doe',
      'rating': 4.8,
      'students': '1.2k',
      'image': 'assets/web.jpeg',
    },
    {
      'title': 'Mobile App Development',
      'instructor': 'Jane Smith',
      'rating': 4.9,
      'students': '950',
      'image': 'assets/mobile.jpeg',
    },
    {
      'title': 'Data Science Fundamentals',
      'instructor': 'Alex Johnson',
      'rating': 4.7,
      'students': '1.5k',
      'image': 'assets/datascience.jpeg',
    },
    {
      'title': 'UI/UX Design Masterclass',
      'instructor': 'Emily Brown',
      'rating': 4.9,
      'students': '800',
      'image': 'assets/UIUX.jpeg',
    },
    {
      'title': 'Python Programming',
      'instructor': 'Michael Lee',
      'rating': 4.6,
      'students': '2.3k',
      'image': 'assets/pythonprogramming.png',
    },
    {
      'title': 'Cloud Computing Essentials',
      'instructor': 'Sarah Wilson',
      'rating': 4.8,
      'students': '1.1k',
      'image': 'assets/cloudcomputing.png',
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Start animations
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search courses...',
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) {
        // Implement search functionality here
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.white,
            size: 26,
          ),
          onPressed: _stopSearch,
        ),
      ];
    }

    return [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.white,
          size: 26,
        ),
        splashRadius: 24,
        onPressed: _startSearch,
      ),
      IconButton(
        icon: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 26,
        ),
        splashRadius: 24,
        onPressed: () {
          // Implement filter functionality
        },
      ),
    ];
  }

  Widget _buildTitle() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Text(
          'Courses',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _isSearching ? _buildSearchField() : _buildTitle(),
        actions: _buildAppBarActions(),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 26,
              ),
              splashRadius: 24,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF2C3E50), // Matching the HomeScreen drawer color
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF34495E), // Matching the HomeScreen drawer header color
                  image: DecorationImage(
                    image: AssetImage('assets/logo_bg.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
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
                leading: Icon(Icons.save_as, color: Colors.white),
                title: Text(
                  'Saved Courses',
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
              Divider(height: 1, color: Colors.white54),
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
              ListTile(
                leading: Icon(Icons.help, color: Colors.white),
                title: Text(
                  'Help & Support',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(child: Container()),
              Divider(),
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
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppBar().preferredSize.height +
                    MediaQuery.of(context).padding.top +
                    20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      category['icon'] as IconData,
                                      size: 40,
                                      color: category['color'] as Color,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      category['title'] as String,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      category['count'] as String,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Text(
                          'Featured Courses',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: featuredCourses.length,
                      itemBuilder: (context, index) {
                        final course = featuredCourses[index];
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Card(
                              margin: EdgeInsets.only(bottom: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(course['image'] as String),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course['title'] as String,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Instructor: ${course['instructor']}',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.amber,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  '${course['rating']}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Icon(
                                                  Icons.people,
                                                  size: 16,
                                                  color: Colors.grey[600],
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  '${course['students']} students',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}