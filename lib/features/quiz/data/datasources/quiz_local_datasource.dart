import 'package:flutter_base/features/quiz/data/models/question_model.dart';

class QuizLocalDatasource {
  List<QuestionModel> getQuestionsByLevel(int level) {
    return _sampleQuestions.where((q) => q.level == level).toList();
  }

  QuestionModel? getQuestionById(String id) {
    final matches = _sampleQuestions.where((q) => q.id == id);
    return matches.isEmpty ? null : matches.first;
  }

  List<QuestionModel> getAllQuestions() => _sampleQuestions;

  static final List<QuestionModel> _sampleQuestions = [
    // Level 1 - Beginner: Widgets basics
    const QuestionModel(
      id: 'q1_001',
      level: 1,
      type: 'multiple_choice',
      title: 'What is a Widget?',
      description:
          'In Flutter, what is the fundamental building block of the UI?',
      options: ['Widget', 'View', 'Component', 'Element'],
      correctAnswerIndex: 0,
      explanation:
          'In Flutter, everything is a Widget. Widgets describe what their '
          'view should look like given their current configuration and state.',
      category: 'widgets',
    ),
    const QuestionModel(
      id: 'q1_002',
      level: 1,
      type: 'multiple_choice',
      title: 'StatelessWidget vs StatefulWidget',
      description:
          'Which widget should you use when the UI does NOT change over time?',
      options: [
        'StatelessWidget',
        'StatefulWidget',
        'InheritedWidget',
        'RenderObjectWidget',
      ],
      correctAnswerIndex: 0,
      explanation:
          'StatelessWidget is used for parts of the UI that do not change '
          'dynamically. It has no mutable state.',
      category: 'widgets',
    ),
    const QuestionModel(
      id: 'q1_003',
      level: 1,
      type: 'fill_in_the_blank',
      title: 'Complete the code',
      description: 'Fill in the blank: class MyWidget extends _____ { }',
      options: [
        'StatelessWidget',
        'StatefulWidget',
        'Widget',
        'State',
      ],
      correctAnswerIndex: 0,
      explanation:
          'To create a widget with no mutable state, extend StatelessWidget.',
      category: 'widgets',
    ),
    const QuestionModel(
      id: 'q1_004',
      level: 1,
      type: 'multiple_choice',
      title: 'The build() method',
      description: 'What does the build() method return?',
      options: ['Widget', 'void', 'State', 'BuildContext'],
      correctAnswerIndex: 0,
      explanation:
          'The build() method returns a Widget that describes the part of '
          'the user interface represented by this widget.',
      category: 'widgets',
    ),
    const QuestionModel(
      id: 'q1_005',
      level: 1,
      type: 'multiple_choice',
      title: 'Hot Reload',
      description: 'What does Hot Reload do in Flutter?',
      options: [
        'Injects updated source code without restarting the app',
        'Restarts the entire application',
        'Clears all application state',
        'Rebuilds the entire widget tree from scratch',
      ],
      correctAnswerIndex: 0,
      explanation:
          'Hot Reload injects updated source code into the running Dart '
          'VM and rebuilds the widget tree, preserving the app state.',
      category: 'basics',
    ),

    // Level 2 - Intermediate: Layout & State
    const QuestionModel(
      id: 'q2_001',
      level: 2,
      type: 'multiple_choice',
      title: 'Row and Column',
      description: 'Which widget arranges its children in a horizontal line?',
      options: ['Row', 'Column', 'Stack', 'Wrap'],
      correctAnswerIndex: 0,
      explanation:
          'Row arranges its children horizontally. Column arranges them '
          'vertically. Both use Flex layout.',
      category: 'layout',
    ),
    const QuestionModel(
      id: 'q2_002',
      level: 2,
      type: 'code_based',
      title: 'Expanded Widget',
      description: 'What does the Expanded widget do inside a Row or Column?',
      options: [
        'Makes the child fill available space',
        'Adds padding around the child',
        'Centers the child',
        'Scrolls the child',
      ],
      correctAnswerIndex: 0,
      explanation:
          'Expanded forces the child to fill available space along the '
          'main axis of a Row, Column, or Flex.',
      codeSnippet: '''
Row(
  children: [
    Expanded(child: Text('Hello')),
    Text('World'),
  ],
)''',
      category: 'layout',
    ),
    const QuestionModel(
      id: 'q2_003',
      level: 2,
      type: 'multiple_choice',
      title: 'setState()',
      description: 'What happens when you call setState() in a StatefulWidget?',
      options: [
        'The framework schedules a rebuild of the widget',
        'The entire app restarts',
        'Only the parent widget rebuilds',
        'Nothing happens visually',
      ],
      correctAnswerIndex: 0,
      explanation:
          'setState() notifies the framework that the internal state has '
          'changed, which schedules a call to the build() method.',
      category: 'state_management',
    ),
    const QuestionModel(
      id: 'q2_004',
      level: 2,
      type: 'multiple_choice',
      title: 'Keys in Flutter',
      description: 'When should you use a Key in Flutter?',
      options: [
        'When widgets move in a collection',
        'Always on every widget',
        'Only on StatelessWidgets',
        'Never',
      ],
      correctAnswerIndex: 0,
      explanation:
          'Keys help Flutter identify which widgets have changed, been '
          'added, or removed, especially in lists and animations.',
      category: 'widgets',
    ),
    const QuestionModel(
      id: 'q2_005',
      level: 2,
      type: 'fill_in_the_blank',
      title: 'Navigator push',
      description:
          'Fill in the blank: Navigator.of(context)._____( MaterialPageRoute(...) )',
      options: ['push', 'pop', 'replace', 'remove'],
      correctAnswerIndex: 0,
      explanation:
          'Navigator.push() adds a route on top of the navigation stack.',
      category: 'navigation',
    ),

    // Level 3 - Advanced: Architecture & Performance
    const QuestionModel(
      id: 'q3_001',
      level: 3,
      type: 'multiple_choice',
      title: 'InheritedWidget',
      description: 'What is the primary purpose of InheritedWidget?',
      options: [
        'Efficiently propagate data down the widget tree',
        'Handle user input events',
        'Manage HTTP requests',
        'Store data in a database',
      ],
      correctAnswerIndex: 0,
      explanation:
          'InheritedWidget is a base class for widgets that efficiently '
          'propagate information down the tree. Provider and many state '
          'management solutions build on top of it.',
      category: 'architecture',
    ),
    const QuestionModel(
      id: 'q3_002',
      level: 3,
      type: 'code_based',
      title: 'const Constructors',
      description:
          'Why is using const constructors beneficial for performance?',
      options: [
        'Prevents unnecessary widget rebuilds',
        'Makes the app compile faster',
        'Reduces APK size',
        'Enables hot reload',
      ],
      correctAnswerIndex: 0,
      explanation:
          'const constructors create compile-time constants. Flutter can '
          "skip rebuilding these widgets because it knows they haven't changed.",
      codeSnippet: 'const Text("Hello World")',
      category: 'performance',
    ),
    const QuestionModel(
      id: 'q3_003',
      level: 3,
      type: 'multiple_choice',
      title: 'Repository Pattern',
      description: 'What is the main benefit of the Repository Pattern?',
      options: [
        'Abstracts data sources from business logic',
        'Makes the UI faster',
        'Eliminates the need for models',
        'Replaces state management',
      ],
      correctAnswerIndex: 0,
      explanation:
          'The Repository Pattern provides an abstraction layer between '
          'data sources and business logic, making it easy to swap '
          'implementations and test in isolation.',
      category: 'architecture',
    ),
    const QuestionModel(
      id: 'q3_004',
      level: 3,
      type: 'multiple_choice',
      title: 'Widget Lifecycle',
      description:
          'In a StatefulWidget, which method is called only once when '
          'the widget is inserted into the tree?',
      options: ['initState', 'build', 'didChangeDependencies', 'dispose'],
      correctAnswerIndex: 0,
      explanation:
          'initState() is called exactly once when the State object is '
          'first created and inserted into the widget tree.',
      category: 'widgets',
    ),
    const QuestionModel(
      id: 'q3_005',
      level: 3,
      type: 'multiple_choice',
      title: 'Isolates',
      description: 'What are Dart Isolates used for?',
      options: [
        'Running code on separate threads',
        'Isolating UI components',
        'Encrypting data',
        'Managing widget keys',
      ],
      correctAnswerIndex: 0,
      explanation:
          'Dart Isolates allow you to run code on separate threads. '
          "Unlike traditional threads, Isolates don't share memory and "
          'communicate via message passing.',
      category: 'performance',
    ),
  ];
}
