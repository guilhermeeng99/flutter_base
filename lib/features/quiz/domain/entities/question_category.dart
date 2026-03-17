import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum QuestionCategory {
  general,
  widgets,
  basics,
  layout,
  stateManagement,
  navigation,
  architecture,
  performance,
}
