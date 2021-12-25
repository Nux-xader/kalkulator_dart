import 'dart:io';

import 'package:test/expect.dart';


void clr() {
  if(Platform.isWindows) {
    stdout.write(Process.runSync("cls", [], runInShell: true).stdout);
  } else {
    stdout.write(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

String format_num(String data) {
  String result = "";
  String startwith = "";
  String after_comma = "";

  if (data[0] == "-") {
    startwith = "-";
    data = data.substring(1, data.length);
  }


  List<String> list_num = data.split(".");
  for (var i = 0; i < list_num.length; i++) {
    if (list_num.length-1 == i) {
      if (int.tryParse(list_num[i]) > 0) {
        after_comma = list_num[i];
      }
    } else {
      result = result+list_num[i];
    }
  }

  data = "";
  result = result.split('').reversed.join('');
  for (var i = 0; i < result.length; i++) {
    if (i%3 == 0 && i>0) {
      data = data+".";
    }
    data = data+result[i];
  }

  data = data.split('').reversed.join('');
  result = "";
  if (after_comma != "") {
    result = data+","+after_comma;
  } else {
    result = data;
  }

  result = startwith+result;
  return result;
}


double getnum(String label) {
  while (true) {
    stdout.write(label);
    double num = double.tryParse(stdin.readLineSync());
    if (num > 0 || num < 1) {
      return num;
    }
    print("Inputan anda salah!");
  }
}


void calc(action) {
  String str_res;
  clr();
  double num1 = getnum("Masukkan angka pertama : ");
  double num2 = getnum("Masukkan angka kedua : ");
  stdout.write("Hasil : ");
  if (action == "sum") {
    double doub_res = num1+num2;
    str_res = doub_res.toString();
  } else if (action == "subtraction") {
    double doub_res = num1-num2;
    str_res = doub_res.toString();
  } else if (action == "multiplication") {
    double doub_res = num1*num2;
    str_res = doub_res.toString();
  } else if (action == "division") {
    double doub_res = num1/num2;
    str_res = doub_res.toString();
  }

  print(format_num(str_res));
}


void menu() {
  print("1. Penjumlahan");
  print("2. Pengurangan");
  print("3. Perkalian");
  print("4. Pembagian");
  print("0. Exit");
}

void main(List<String> arguments) {
  String choice;
  String x;
  bool again;
  clr();
  menu();
  while (true) {
    stdout.write("Pilih : ");
    choice = stdin.readLineSync();

    if (choice == "1") {
      calc("sum");
    } else if (choice == "2") {
      calc("subtraction");
    } else if (choice == "3") {
      calc("multiplication");
    } else if (choice == "4") {
      calc("division");
    } else if (choice == "0") {
      break;
    } else {
      print("Mohon menginputkan pilihan yang tepat");
      continue;
    }


    again = false;

    while (true) {
      stdout.write("Apakah ingin menghitung lagi? (y/n) : ");
      x = stdin.readLineSync();
      if (x == "y" || x == "Y") {
        again = true;
        break;
      } else if (x == "n" || x == "N") {
        break;
      }
      print("Mohon pilih (y/n)");
    }

    if (!again) {
      print("Terimakasih telah menggunakan program ini:)");
      break;
    }
  clr();
  menu();
  }
}
