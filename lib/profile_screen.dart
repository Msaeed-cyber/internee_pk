import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  String currentDate = '2025-01-28 19:52:44';
  final String userLogin = 'Msaeed-cyber';
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
    updateCurrentTime();
  }

  void updateCurrentTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().toUtc());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: AnimatedOpacity(
          opacity: _fadeAnimation.value,
          duration: Duration(milliseconds: 500),
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Edit profile coming soon!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/logo_bg.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                currentAccountPicture: Hero(
                  tag: 'profile-picture',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/you.jpg'),
                  ),
                ),
                accountName: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userLogin,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      currentDate,
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
                leading: Icon(Icons.home, color: Colors.blue),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                leading: Icon(Icons.book, color: Colors.blue),
                title: Text('My Courses'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.notification_important, color: Colors.blue),
                title: Text('Notifications'),
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
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.explore, color: Colors.blue),
                title: Text('Explore'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text('Settings'),
                onTap: () => Navigator.pop(context),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red.shade300),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
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
              SizedBox(height: AppBar().preferredSize.height + MediaQuery.of(context).padding.top),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: 'profile-picture',
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage('assets/you.jpg'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      userLogin,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'saeedmian074@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Last Updated: $currentDate',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildStatColumn('Enrolled', '4'),
                        ),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        Expanded(
                          child: _buildStatColumn('Completed', '2'),
                        ),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.grey[300],
                        ),
                        Expanded(
                          child: _buildStatColumn('Certificates', '1'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildSection(
                'Enrolled Courses',
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildCourseCard(
                      'Course ${index + 1}',
                      'Description for Course ${index + 1}',
                      '${(index + 1) * 25}% Complete',
                      Icons.book,
                      Colors.blue,
                    );
                  },
                ),
              ),
              _buildSection(
                'Applied Internships',
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildInternshipCard(
                      'Internship ${index + 1}',
                      'Company ${index + 1}',
                      index == 0 ? 'In Progress' : 'Pending',
                      index == 0 ? Colors.green : Colors.orange,
                    );
                  },
                ),
              ),
              _buildSection(
                'Achieved Certificates',
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return _buildCertificateCard(
                      'Flutter Development Certificate',
                      'Issued on: $currentDate',
                      Icons.workspace_premium,
                      Colors.amber,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.message),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Messages coming soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatColumn(String title, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget content) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildCourseCard(
      String title,
      String description,
      String progress,
      IconData icon,
      Color color,
      ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(description),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: double.parse(progress.replaceAll(RegExp(r'[^0-9]'), '')) / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            SizedBox(height: 4),
            Text(
              progress,
              style: TextStyle(color: color),
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Course details coming soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInternshipCard(
      String title,
      String company,
      String status,
      Color statusColor,
      ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(company),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(color: statusColor),
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Internship details coming soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCertificateCard(
      String title,
      String date,
      IconData icon,
      Color color,
      ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(date),
        trailing: IconButton(
          icon: Icon(Icons.download, color: Colors.blue),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Certificate download coming soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}