class Questions {
  String question;
  List<String> answers;

  Questions({required this.question, required this.answers});
}

List<Questions> data = [
// Question 1
  Questions(
    question:
        'What programming language is primarily used for Flutter app development?',
    answers: ['Dart', 'Java', 'Kotlin', 'Swift'],
  ),

// Question 2
  Questions(
    question:
        'Which widget in Flutter is used to create a scrollable list of widgets?',
    answers: ['ListView', 'ScrollList', 'ScrollWidget', 'ListScroll'],
  ),

  Questions(
    question: 'What does the MaterialApp widget in Flutter provide?',
    answers: [
      'A material design-themed application',
      'A canvas to draw custom graphics',
      'A platform to make HTTP requests',
      'A database for local storage'
    ],
  ),

// Question 4
  Questions(
    question: 'What is the purpose of the setState() method in Flutter?',
    answers: [
      'To rebuild the widget tree and update the UI',
      'To initialize the state of a widget',
      'To define the layout of a widget',
      'To remove a widget from the widget tree'
    ],
  ),

// Question 5
  Questions(
    question: 'Which Flutter class is used for routing and navigation?',
    answers: ['Navigator', 'Router', 'RouteManager', 'PathFinder'],
  ),

// Question 6
  Questions(
    question: 'What does the hot reload feature in Flutter do?',
    answers: [
      'Updates the code in the running application without restarting it',
      'Restarts the entire application',
      'Reloads the Dart Virtual Machine',
      'Compiles the code to native machine code'
    ],
  ),

// Question 7
  Questions(
    question: 'What is a StatefulWidget in Flutter?',
    answers: [
      'A widget that can be updated dynamically',
      'A widget that can\'t be updated after initialization',
      'A widget without any state',
      'A widget specifically for navigation'
    ],
  ),

// Question 8
  Questions(
    question: 'What does the \'async\' keyword indicate in Dart and Flutter?',
    answers: [
      'It indicates a function that returns a Future',
      'It defines a synchronous function',
      'It specifies a function that runs on the main thread',
      'It signifies a function that can\'t have any asynchronous operations'
    ],
  ),

// Question 9
  Questions(
    question: 'Which widget is used for a material design app bar in Flutter?',
    answers: ['AppBar', 'TopBar', 'HeaderBar', 'NavAppBar'],
  ),

// Question 10
  Questions(
    question:
        'What is the purpose of the \'key\' parameter in Flutter widgets?',
    answers: [
      'It uniquely identifies a widget in the widget tree, enabling state preservation during rebuilds',
      'It defines the color of the widget',
      'It specifies the font size of the widget',
      'It determines the position of the widget on the screen'
    ],
  ),
];
