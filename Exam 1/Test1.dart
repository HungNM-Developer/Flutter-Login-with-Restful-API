void Sort_Giam_Dan(List<int> arr, int n) {
  // Dùng Insertion Sort
  int i, temp, j;
  for (i = 1; i < n; i++) {
    temp = arr[i];
    j = i - 1;

    while (j >= 0 && temp > arr[j]) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = temp;
  }
}

main() {
  /////////////////////////////j  i
  final List<int> numbers_1 = [0, 10, 1, 99, 9, 8, 79, 91, 22, 32, 12];
  final List<int> numbers_2 = [99, 19, 29, 39, 11, 21, 32, 33, 35, 50, 60, 90];
  final List<int> numbers_3 = [1, 10, 19, 11, 13, 16, 19];
  try {
    Sort_Giam_Dan(numbers_1, numbers_1.length);
    Sort_Giam_Dan(numbers_2, numbers_2.length);
    Sort_Giam_Dan(numbers_3, numbers_3.length);
  } catch (e) {
    print('Print error message: $e');
  }

  print("Số lớn nhất của dãy 1 là: " + numbers_1.join(""));
  print("Số lớn nhất của dãy 2 là: " + numbers_2.join(""));
  print("Số lớn nhất của dãy 3 là: " + numbers_3.join(""));
}
