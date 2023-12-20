Map<String, Map<String, dynamic>> params = {
  "BlogOne": {
    "height": 150,
    "width": 150,
    "shouldRepeat": 3,
    "img": 1,
    "category": "category",
    "title": "title",
    "description": "desc"
  },
  "HeaderOne": {
    "height": 50,
    "width": 30000,
    "category": ["category"],
    "title": ["title"],
    "description": ["desc"],
    "name": "HeaderOne"
  }
};

String getNextLetterCombination(String input) {
  // Преобразование в верхний регистр, чтобы регистр не влиял на результат
  input = input.toUpperCase();

  // Проверка, состоит ли строка из букв
  if (!RegExp(r'^[A-Z]+$').hasMatch(input)) {
    return input; // Если строка не состоит из букв, возвращаем как есть
  }

  // Преобразование строки в список символов
  List<String> letters = input.split('');

  // Функция для генерации следующей буквенной комбинации
  String generateNextCombination(List<String> letters) {
    int index = letters.length - 1;

    // Пока индекс неотрицателен и текущая буква равна 'Z', устанавливаем 'A' и переходим к предыдущей букве
    while (index >= 0 && letters[index] == 'Z') {
      letters[index] = 'A';
      index--;
    }

    // Если весь индекс -1, добавляем новую букву 'A' в начало
    if (index == -1) {
      letters.insert(0, 'A');
    } else {
      // Иначе, увеличиваем текущую букву на одну
      letters[index] = String.fromCharCode(letters[index].codeUnitAt(0) + 1);
    }

    // Объединяем буквы обратно в строку
    return letters.join('');
  }

  // Генерация следующей буквенной комбинации
  return generateNextCombination(letters);
}
