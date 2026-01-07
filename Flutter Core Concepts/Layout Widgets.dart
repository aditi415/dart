1. Container - The Versatile Box Widget
dart
Container(
  // Size properties
  width: 100,
  height: 100,
  constraints: BoxConstraints(
    minWidth: 50,
    maxWidth: 200,
    minHeight: 50,
    maxHeight: 200,
  ),
  
  // Spacing
  margin: EdgeInsets.all(10), // Space outside container
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Space inside
  
  // Decoration (appearance)
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12), // Rounded corners
    border: Border.all(
      color: Colors.blue.shade800,
      width: 2,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.lightBlue],
    ),
  ),
  
  // Transformations
  transform: Matrix4.rotationZ(0.1), // 3D transformations
  
  // Child widget
  child: Text('Hello'),
  
  // Alignment
  alignment: Alignment.center,
)
Purpose: Container is a versatile widget that combines painting, positioning, and sizing capabilities. It's like a <div> in HTML - can contain a single child and apply multiple styles.
When to use:

Need padding/margin around a widget

Want to add background color/border


2. SizedBox - Fixed Size Box
dart
// 1. Fixed size box
SizedBox(
  width: 100,
  height: 50,
  child: Text('Fixed Size'),
)

// 2. Spacer (empty space)
SizedBox(height: 20), // Vertical space
SizedBox(width: 10),  // Horizontal space

// 3. Expand to fill
SizedBox.expand(
  child: Container(color: Colors.red),
)

// 4. Shrink to nothing
SizedBox.shrink()
Purpose: Simple box with a fixed size. Primarily used for spacing and constraining child widgets.

Key Difference from Container: SizedBox is simpler and more performant when you only need size constraints without decoration.

3. Padding & Margin
dart
// Padding (space INSIDE widget)
Padding(
  padding: EdgeInsets.all(16), // All sides
  // EdgeInsets.only(left: 10, top: 5)
  // EdgeInsets.symmetric(horizontal: 10, vertical: 5)
  // EdgeInsets.fromLTRB(10, 5, 10, 5)
  child: Text('Padded Text'),
)

// Margin (space OUTSIDE widget) - Usually through Container
Container(
  margin: EdgeInsets.all(10),
  child: Text('With Margin'),
)

// Edge Insets Variations:
EdgeInsets.all(10)            // All: 10
EdgeInsets.only(left: 10)     // Only left: 10
EdgeInsets.symmetric(         // Horizontal: 10, Vertical: 5
  horizontal: 10,
  vertical: 5,
)
EdgeInsets.fromLTRB(10,5,10,5) // Left, Top, Right, Bottom
Purpose: Control spacing around widgets. Padding affects inside space, margin affects outside space.

4. Row & Column - Linear Layouts
dart
Row(
  mainAxisAlignment: MainAxisAlignment.start, // Horizontal alignment
  // Options: start, end, center, spaceBetween, spaceAround, spaceEvenly
  
  crossAxisAlignment: CrossAxisAlignment.center, // Vertical alignment
  // Options: start, end, center, stretch, baseline
  
  mainAxisSize: MainAxisSize.max, // Take full width
  // Options: max (full width), min (shrink to content)
  
  textDirection: TextDirection.ltr, // Left to right
  verticalDirection: VerticalDirection.down, // Top to bottom
  
  children: [
    Icon(Icons.star),
    SizedBox(width: 8), // Spacing
    Text('Rating: 4.5'),
    Spacer(), // Flexible space
    Text('See reviews'),
  ],
)

Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch, // Children fill width
  
  children: [
    Text('Title', style: TextStyle(fontSize: 24)),
    SizedBox(height: 16),
    Text('Subtitle'),
    Expanded( // Takes remaining space
      child: Container(color: Colors.grey),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Submit'),
    ),
  ],
)
Purpose: Arrange children in a horizontal (Row) or vertical (Column) line. Fundamental for building layouts.

Important: Row/Column don't scroll by default. Use SingleChildScrollView if content might overflow.

5. Stack - Overlapping Widgets
dart
Stack(
  // How to size the stack
  fit: StackFit.expand, // Fill parent
  // Options: loose (child size), expand (parent size), passthrough
  
  // How to position non-positioned children
  alignment: Alignment.center,
  
  // How to handle overflow
  clipBehavior: Clip.hardEdge,
  
  children: [
    // Background - fills stack
    Container(color: Colors.blue),
    
    // Positioned widget - absolute positioning
    Positioned(
      top: 10,
      left: 10,
      child: Icon(Icons.close),
    ),
    
    // Positioned with constraints
    Positioned.fill( // Fill parent with padding
      top: 20,
      left: 20,
      right: 20,
      bottom: 20,
      child: Container(color: Colors.white),
    ),
    
    // Non-positioned widget - uses alignment
    Text('Centered Text'),
    
    // Positioned at bottom right
    Positioned(
      bottom: 10,
      right: 10,
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    ),
  ],
)
Purpose: Overlap multiple widgets. Useful for badges, overlays, complex designs.

6. Expanded & Flexible
dart
Row(
  children: [
    // Takes 1/3 of available space
    Expanded(
      flex: 1, // Relative weight
      child: Container(color: Colors.red),
    ),
    
    // Takes 2/3 of available space
    Expanded(
      flex: 2,
      child: Container(color: Colors.green),
    ),
    
    // Fixed width, won't expand
    Container(
      width: 50,
      color: Colors.blue,
    ),
  ],
)

// Flexible vs Expanded
Column(
  children: [
    // Flexible - can be smaller than available space
    Flexible(
      fit: FlexFit.loose, // Can be smaller
      flex: 1,
      child: Container(color: Colors.red, height: 50),
    ),
    
    // Expanded - must fill available space
    Expanded(
      flex: 2,
      child: Container(color: Colors.green),
    ),
  ],
)
Purpose: Control how children of Row/Column use available space. Expanded forces child to fill space, Flexible allows child to be smaller.

7. Scrollable Widgets
dart
// SingleChildScrollView - For single scrollable content
SingleChildScrollView(
  scrollDirection: Axis.horizontal, // or vertical
  padding: EdgeInsets.all(16),
  physics: BouncingScrollPhysics(), // iOS style
  // AlwaysScrollableScrollPhysics() - Always scrollable
  // NeverScrollableScrollPhysics() - Disable scrolling
  
  child: Column(
    children: List.generate(20, (i) => Text('Item $i')),
  ),
)

// ListView - For lists
ListView(
  children: [ // All items loaded at once
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
  ],
)

// ListView.builder - Lazy loading for long lists
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item $index'),
    );
  },
  // Lazy loading - only visible items are built
)

// GridView
GridView.count(
  crossAxisCount: 2, // 2 items per row
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  children: List.generate(10, (i) => 
    Container(color: Colors.blue, child: Center(child: Text('$i'))),
  ),
)

// GridView.builder for large grids
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  itemCount: 100,
  itemBuilder: (context, index) => Container(color: Colors.red),
)
Purpose: Handle content that exceeds screen size. Use builder versions for performance with large lists.

8. ConstrainedBox, AspectRatio, FractionallySizedBox
dart
// ConstrainedBox - Apply size constraints
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 100,
    maxWidth: 200,
    minHeight: 50,
    maxHeight: 100,
  ),
  child: Container(color: Colors.blue),
)

// AspectRatio - Maintain aspect ratio
AspectRatio(
  aspectRatio: 16 / 9, // Width:Height ratio
  child: Container(color: Colors.red),
)

// FractionallySizedBox - Size relative to parent
FractionallySizedBox(
  widthFactor: 0.5, // 50% of parent width
  heightFactor: 0.3, // 30% of parent height
  child: Container(color: Colors.green),
)
Purpose: Advanced size control widgets for responsive design.



Need to constrain widget size

Applying transformations

Creating custom shapes with decoration
