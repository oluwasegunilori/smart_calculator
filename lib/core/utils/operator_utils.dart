const List<String> operators = ['+', '-', '*', '/', '%'];

bool isArithmeticOperator(String str) {
  // Check if the string is in the list of operators
  return operators.contains(str);
}
