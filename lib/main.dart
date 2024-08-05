import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF061023), // Darkest grey background
        primaryColor: Color(0xFF813ef2), // Purple accent color

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF061023),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Color(0xFF7C4DFF),
          unselectedLabelColor: Color.fromARGB(76, 167, 135, 255),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF7C4DFF),
                width: 2,
              ),
            ),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
            style: TextStyle(
              fontSize: 20, // Changed font size to 24
              fontWeight: FontWeight.bold, // Made the text bold
              color: Color(0xFFD3DBFA), // Changed text color to white
              fontFamily: 'Hummingbird', // Added Times New Roman font
            ),
          ),
          centerTitle: true, // Centered the title

          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.school)),
              Tab(icon: Icon(Icons.build)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.contact_mail)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PersonalInfoTab(),
            EducationTab(),
            SkillsTab(),
            InterestsTab(),
            ContactTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(Widget tabContent) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          color: Color(0xFF161B3E), // Darker grey for the box background
          padding: EdgeInsets.all(16.0), // Added padding around the content
          child: tabContent,
        ),
      ),
    );
  }
}

class PersonalInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Adjust top spacing as needed
          Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD3DBFA),
              fontFamily: 'Hummingbird',
            ),
          ),
          SizedBox(height: 20),
          Container(
            constraints:
                BoxConstraints(maxWidth: 400), // Adjust maxWidth as needed
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color:
                  Color(0xFF161B3E), // Darker grey for the container background
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/profile.jpg',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Efraym John C. Valler',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD3DBFA),
                    fontFamily: 'Hummingbird',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '22 Years Old',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFD3DBFA),
                    fontFamily: 'VAGRoundedNext',
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Professional Procrastinator',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFD3DBFA),
                      fontFamily: 'VAGRoundedNext',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  final List<Education> educationData = [
    Education(
        degree: 'Bachelor of Science in Information Technology',
        institution: 'Batangas State University',
        years: '2021 - Present'),
    Education(
        degree: 'High School Diploma',
        institution: 'Manuel S. Enverga University Foundation',
        years: '2019 - 2021'),
    Education(
        degree: 'Junior High School Education',
        institution: 'Manuel S. Enverga University Foundation',
        years: '2014 - 2019'),
    Education(
        degree: 'Elementary Education',
        institution: 'Unisan Central Elementary School',
        years: '2009 - 2014'),
    // Add more education entries here
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Adjust top spacing as needed
          Text(
            'Education',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD3DBFA),
              fontFamily: 'Hummingbird',
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(
                    0xFF161B3E), // Darker grey for the container background
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              constraints:
                  BoxConstraints(maxWidth: 600), // Adjust maxWidth as needed
              child: ListView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevent ListView from scrolling
                itemCount: educationData
                    .length, // Use the length of the education data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      educationData[index].degree,
                      style: TextStyle(
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                    subtitle: Text(
                      '${educationData[index].institution} (${educationData[index].years})',
                      style: TextStyle(
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'VAGRoundedNext',
                      ),
                    ),
                    leading: Icon(Icons.school, color: Color(0xFFD3DBFA)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Education {
  final String degree;
  final String institution;
  final String years;

  Education(
      {required this.degree, required this.institution, required this.years});
}

class SkillsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Adjust top spacing as needed
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD3DBFA),
              fontFamily: 'Hummingbird',
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0), // Added margin
              decoration: BoxDecoration(
                color: Color(
                    0xFF161B3E), // Darker grey for the container background
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              constraints:
                  BoxConstraints(maxWidth: 600), // Adjust maxWidth as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.code, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Technical Skills:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• HTML/CSS',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• JavaScript',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• React.js',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading:
                        Icon(Icons.lightbulb_outline, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Non-Technical Skills:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Problem-solving',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• Communication',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• Time Management',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.school, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Certifications and Training:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Certificate of Completion – Website Design – Work Immersion Program for SHS (80 Hours)',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
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

class InterestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Adjust top spacing as needed
          Text(
            'Interests',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD3DBFA),
              fontFamily: 'Hummingbird',
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0), // Added margin
              decoration: BoxDecoration(
                color: Color(
                    0xFF161B3E), // Darker grey for the container background
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              constraints:
                  BoxConstraints(maxWidth: 600), // Adjust maxWidth as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.work, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Professional Interests:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• User Experience (UX) Design',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• Web Performance Optimization',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• API Integration',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.star, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Specializations:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Frontend Development',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• E-commerce Development',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• UI/UX Design',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.book, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Research Areas:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Web Accessibility',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• Web Standards and Best Practices',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.cases_rounded, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Notable Projects:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 50.0), // Adjust the indent as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Ad Listing Website',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        Text(
                          '• Real Property Taxation Payment Website',
                          style: TextStyle(
                            color: Color(0xFFD3DBFA),
                            fontFamily: 'VAGRoundedNext',
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
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

class ContactTab extends StatelessWidget {
  // Function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20), // Adjust top spacing as needed
          Text(
            'Contact Me',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD3DBFA),
              fontFamily: 'Hummingbird',
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0), // Added margin
              decoration: BoxDecoration(
                color: Color(
                    0xFF161B3E), // Darker grey for the container background
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              constraints:
                  BoxConstraints(maxWidth: 600), // Adjust maxWidth as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text(
                      '21-01614@g.batstate-u.edu.ph',
                      style: TextStyle(
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'VAGRoundedNext',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.phone, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Phone:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text(
                      '+63 921 340 3225',
                      style: TextStyle(
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'VAGRoundedNext',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.link, color: Color(0xFFD3DBFA)),
                    title: Text(
                      'Social Media:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD3DBFA),
                        fontFamily: 'Hummingbird',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://www.facebook.com/ej.valler.3/');
                          },
                          child: Text(
                            'Facebook: EJ Valler',
                            style: TextStyle(
                              color: Color(0xFFD3DBFA),
                              fontFamily: 'VAGRoundedNext',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://www.instagram.com/ej.flac/');
                          },
                          child: Text(
                            'Instagram: @ej.flac',
                            style: TextStyle(
                              color: Color(0xFFD3DBFA),
                              fontFamily: 'VAGRoundedNext',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://twitter.com/ej.flac');
                          },
                          child: Text(
                            'Twitter: @ej.flac',
                            style: TextStyle(
                              color: Color(0xFFD3DBFA),
                              fontFamily: 'VAGRoundedNext',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Add more social media links here
                      ],
                    ),
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
