class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({
   required this.title,
   this.value = false,
});

}

final shoppingList = [
  CheckBoxState(title: 'Milk'),
  CheckBoxState(title: 'Eggs'),
  CheckBoxState(title: 'Coffee'),
  CheckBoxState(title: 'Paper towels'),
  CheckBoxState(title: 'Dog food')
];