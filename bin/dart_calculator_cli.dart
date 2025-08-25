import 'dart:io';
import 'package:math_expressions/math_expressions.dart';

void main() {
  print(
    "\nDart Calculator CLI\nBy Bruno Magno\n\nType the expression to be calculated or 'exit' to quit.",
  );

  while (true) {
    stdout.write("\nExpression: ");
    String input = stdin.readLineSync()!.trim();

    if (input.toLowerCase() == "exit") {
      print("See you late bro...");
      break;
    }

    try {
      GrammarParser parser = GrammarParser();
      Expression exp = parser.parse(input);
      ContextModel cm = ContextModel();
      double result = RealEvaluator(cm).evaluate(exp).toDouble();
      print("Result: $result");
    } catch (e) {
      print("Invalid expression. Please try again.");
    }
  }
}
