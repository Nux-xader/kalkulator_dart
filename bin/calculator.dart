import 'dart:io';


void clr() {
  if(Platform.isWindows) {
    // not tested, I don't have Windows
    // may not to work because 'cls' is an internal command of the Windows shell
    // not an executeable
    print(Process.runSync("cls", [], runInShell: true).stdout); 
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

void main(List<String> arguments) {
  clr();
  print("1. Penjumlahan");
  print("2. Pengrangan");
  print("3. Perkalian");
  print("4. Pembagian");
  stdout.write("Pilih : ");
  String choice = stdin.readLineSync();
}
