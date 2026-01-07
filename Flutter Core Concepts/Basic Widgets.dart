1. Text & RichText
dart
// Basic Text
Text(
  'Hello Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.5,
    height: 1.2, // Line height
    backgroundColor: Colors.yellow,
    decoration: TextDecoration.underline,
    decorationColor: Colors.red,
    decorationStyle: TextDecorationStyle.wavy,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis, // ... when text overflows
  textScaleFactor: 1.0, // Respect user font size preference
  strutStyle: StrutStyle(
    fontSize: 16,
    height: 1.5,
  ),
)

// RichText for multiple styles
RichText(
  text: TextSpan(
    style: TextStyle(color: Colors.black, fontSize: 16),
    children: [
      TextSpan(text: 'Hello '),
      TextSpan(
        text: 'Flutter',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      TextSpan(text: '! This is '),
      TextSpan(
        text: 'RichText',
        style: TextStyle(
          backgroundColor: Colors.yellow,
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  ),
)

// Text with Google Fonts (add google_fonts package)
// Text(
//   'Styled Text',
//   style: GoogleFonts.lato(fontSize: 30),
// )
Purpose: Display text with styling. RichText for multiple styles in single widget.

2. Icon
dart
Icon(
  Icons.favorite, // Material Icons
  color: Colors.red,
  size: 30,
  semanticLabel: 'Favorite button', // For accessibility
)

// Using IconData from other icon packs
Icon(
  IconData(0xf042, fontFamily: 'FontAwesome'),
  size: 30,
)

// IconButton - clickable icon
IconButton(
  icon: Icon(Icons.settings),
  iconSize: 30,
  color: Colors.blue,
  onPressed: () {
    print('Icon pressed');
  },
  tooltip: 'Settings', // Shows on long press
)
Purpose: Display vector icons from Material/Cupertino or custom icon fonts.

3. Image
dart
// 1. Network Image
Image.network(
  'https://example.com/image.jpg',
  width: 100,
  height: 100,
  fit: BoxFit.cover, // How to fit in box
  // BoxFit.fill - Stretch to fill (distorts)
  // BoxFit.contain - Fit within, maintain aspect ratio
  // BoxFit.cover - Cover box, maintain aspect ratio
  // BoxFit.fitWidth/fitHeight
  // BoxFit.scaleDown - Shrink if too large
  
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
          : null,
    );
  },
  
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error);
  },
  
  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
    if (wasSynchronouslyLoaded) return child;
    return AnimatedOpacity(
      child: child,
      opacity: frame == null ? 0 : 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  },
)

// 2. Asset Image (add to pubspec.yaml)
// flutter:
//   assets:
//     - assets/images/
Image.asset(
  'assets/images/logo.png',
  width: 100,
  height: 100,
)

// 3. File Image
Image.file(
  File('/path/to/image.jpg'),
)

// 4. Memory Image
Image.memory(
  Uint8List.fromList([/* bytes */]),
)

// For cached network images, use cached_network_image package
// CachedNetworkImage(imageUrl: '...')
Purpose: Display images from various sources with loading/error handling.

4. Buttons
dart
// ElevatedButton - Primary action
ElevatedButton(
  onPressed: () {
    print('Button pressed');
  },
  onLongPress: () {
    print('Long pressed');
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 5,
    shadowColor: Colors.blue.withOpacity(0.3),
    minimumSize: Size(100, 50),
    maximumSize: Size(200, 60),
    side: BorderSide(color: Colors.blue.shade800, width: 1),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.send),
      SizedBox(width: 8),
      Text('Send Message'),
    ],
  ),
)

// TextButton - Secondary action
TextButton(
  onPressed: () {},
  style: TextButton.styleFrom(
    foregroundColor: Colors.blue,
    padding: EdgeInsets.all(12),
  ),
  child: Text('Cancel'),
)

// OutlinedButton - Less emphasis
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.blue),
    shape: StadiumBorder(), // Circular ends
  ),
  child: Text('Learn More'),
)

// IconButton
IconButton(
  icon: Icon(Icons.favorite),
  color: Colors.red,
  iconSize: 30,
  onPressed: () {},
)

// FloatingActionButton
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  elevation: 6,
  shape: CircleBorder(),
  tooltip: 'Add item',
)
Purpose: Interactive buttons for user actions. Different styles for different emphasis levels.

5. TextField & Form
dart
// Single TextField
TextField(
  controller: _controller, // To get/set text
  decoration: InputDecoration(
    labelText: 'Username',
    hintText: 'Enter your username',
    prefixIcon: Icon(Icons.person),
    suffixIcon: IconButton(
      icon: Icon(Icons.clear),
      onPressed: () => _controller.clear(),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    filled: true,
    fillColor: Colors.grey[100],
    contentPadding: EdgeInsets.all(16),
  ),
  
  // Text Input Properties
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  textCapitalization: TextCapitalization.words,
  style: TextStyle(fontSize: 16),
  textAlign: TextAlign.start,
  
  // Validation
  obscureText: true, // For passwords
  maxLength: 20,
  maxLines: 1,
  
  // Callbacks
  onChanged: (value) {
    print('Text changed: $value');
  },
  onSubmitted: (value) {
    print('Submitted: $value');
  },
  onTap: () {
    print('Field tapped');
  },
)

// Complete Form with Validation
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Form(
  key: _formKey,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  child: Column(
    children: [
      TextFormField(
        controller: _emailController,
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email';
          }
          if (!value.contains('@')) {
            return 'Invalid email';
          }
          return null;
        },
      ),
      
      TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) {
          if (value == null || value.length < 6) {
            return 'Password must be 6+ characters';
          }
          return null;
        },
      ),
      
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print('Form is valid');
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
Purpose: TextField for single text input, Form for grouping and validating multiple inputs.

6. Checkbox, Radio, Switch
dart
bool _isChecked = false;
String _selectedOption = 'option1';
bool _isSwitched = false;

Column(
  children: [
    // Checkbox
    CheckboxListTile(
      title: Text('Accept Terms & Conditions'),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value!;
        });
      },
      secondary: Icon(Icons.description),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.blue,
      checkColor: Colors.white,
    ),
    
    Divider(),
    
    // Radio buttons for single selection
    RadioListTile<String>(
      title: Text('Option 1'),
      value: 'option1',
      groupValue: _selectedOption,
      onChanged: (value) {
        setState(() {
          _selectedOption = value!;
        });
      },
    ),
    
    RadioListTile<String>(
      title: Text('Option 2'),
      value: 'option2',
      groupValue: _selectedOption,
      onChanged: (value) {
        setState(() {
          _selectedOption = value!;
        });
      },
    ),
    
    Divider(),
    
    // Switch
    SwitchListTile(
      title: Text('Enable Notifications'),
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      secondary: Icon(Icons.notifications),
      activeColor: Colors.blue,
      inactiveThumbColor: Colors.grey,
    ),
  ],
)
Purpose: Selection widgets for boolean values (Checkbox, Switch) or single choice from options (Radio).

7. AppBar
dart
AppBar(
  // Title
  title: Text('My App'),
  
  // Leading widget (usually back button)
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {
      Scaffold.of(context).openDrawer();
    },
  ),
  
  // Actions in top right
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
    PopupMenuButton<String>(
      onSelected: (value) {},
      itemBuilder: (context) => [
        PopupMenuItem(value: 'settings', child: Text('Settings')),
        PopupMenuItem(value: 'help', child: Text('Help')),
      ],
    ),
  ],
  
  // Flexible space for background
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.lightBlue],
      ),
    ),
  ),
  
  // Bottom section (for TabBar)
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(48),
    child: TabBar(
      tabs: [
        Tab(icon: Icon(Icons.home), text: 'Home'),
        Tab(icon: Icon(Icons.settings), text: 'Settings'),
      ],
    ),
  ),
  
  // Styling
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  elevation: 4,
  shadowColor: Colors.black.withOpacity(0.3),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
  ),
  
  // Size
  toolbarHeight: 56,
  centerTitle: true,
)
Purpose: Top app bar with title, actions, and navigation controls.

8. BottomNavigationBar
dart
int _currentIndex = 0;

Scaffold(
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() {
        _currentIndex = index;
      });
    },
    
    // Navigation items
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
        backgroundColor: Colors.green,
      ),
      BottomNavigationBarItem(
        icon: Badge(
          label: Text('3'),
          child: Icon(Icons.notifications),
        ),
        label: 'Notifications',
        backgroundColor: Colors.orange,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        backgroundColor: Colors.purple,
      ),
    ],
    
    // Styling
    type: BottomNavigationBarType.fixed, // or shifting
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    selectedFontSize: 12,
    unselectedFontSize: 10,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    elevation: 8,
    iconSize: 24,
  ),
  
  body: _getPage(_currentIndex), // Function to return current page
)
Purpose: Bottom navigation for switching between primary destinations in app.

9. Drawer
dart
Drawer(
  // Background color
  backgroundColor: Colors.white,
  
  // Elevation/shadow
  elevation: 16,
  
  // Shape
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
  ),
  
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      // Header
      DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'john@example.com',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
      
      // Menu items
      ListTile(
        leading: Icon(Icons.home, color: Colors.blue),
        title: Text('Home'),
        onTap: () {
          Navigator.pop(context); // Close drawer
          Navigator.pushNamed(context, '/home');
        },
        tileColor: Colors.blue[50], // Highlight current
      ),
      
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settings');
        },
      ),
      
      Divider(),
      
      ListTile(
        leading: Icon(Icons.help),
        title: Text('Help & Support'),
        onTap: () {},
      ),
      
      ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text('Logout', style: TextStyle(color: Colors.red)),
        onTap: () {
          // Handle logout
        },
      ),
    ],
  ),
)
Purpose: Side navigation panel accessible via swipe or menu button.

10. TabBar
dart
DefaultTabController(
  length: 3, // Number of tabs
  child: Scaffold(
    appBar: AppBar(
      title: Text('Tab Bar Example'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.search), text: 'Search'),
          Tab(icon: Icon(Icons.person), text: 'Profile'),
        ],
        
        // Styling
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        
        // Physics
        isScrollable: false, // Set true for many tabs
        
        // Custom indicator
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.3),
        ),
        
        // Divider
        dividerColor: Colors.transparent,
      ),
    ),
    
    body: TabBarView(
      children: [
        Center(child: Text('Home Tab Content')),
        Center(child: Text('Search Tab Content')),
        Center(child: Text('Profile Tab Content')),
      ],
      
      // Physics
      physics: NeverScrollableScrollPhysics(), // Disable swipe
    ),
  ),
)
Purpose: Tab-based navigation within a screen.


