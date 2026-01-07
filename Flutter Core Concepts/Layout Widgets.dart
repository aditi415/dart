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

Need to constrain widget size

Applying transformations

Creating custom shapes with decoration
