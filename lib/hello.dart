import 'dart:io';
import 'package:guess_number2/game.dart';

void main() {
  List<int> list = [];

  while (true) {
    stdout.write('Enter a maximum number to random : ');
    var inmax = stdin.readLineSync();
    var maxRan = int.tryParse(inmax!);
    var game = Game();

    if (inmax != null) {
      game = Game(maxRandom: maxRan!);
    } else {
      maxRan = 100;
    }

    int result = 0;
    int count = 0;

    print('╔══════════════════════════════════════════════════ ');
    print('║               GUESS THE NUMBER');
    print('╟──────────────────────────────────────────────────');
    do {
      stdout.write('║ Please guess the number between 1 and $maxRan : ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!); // ! = non-null

      if (guess == null) {
        print('║ Please enter "Number" only');
        print('╟──────────────────────────────────────────────────');
        continue;
      }

      result = game.doGuess(guess);
      count++;

      if (result == 1) {
        print('║ $guess is too High ▲');
      } else if (result == 2) {
        print('║ $guess is too Low ▼');
      } else if (result == 3) {
        print('║ $guess is Correct ♥, TOTAL GUESSES : $count');

        int answer = game.answer;
        list.add(answer);
      }

      print('╟──────────────────────────────────────────────────');
    } while (result != 3);

    print('║                      THE END');
    print("╚══════════════════════════════════════════════════");

    while (true) {
      stdout.write('Play again? (Y/N) : ');
      var play = stdin.readLineSync();
      if (play == 'n' || play == 'N') {
        int round = list.length;
        //print('list len = ${list.length} , round = $round');
        print('');
        print("You've played $round game");

        for (int i = 0; i < round; ++i) {
          print('🚀 Game #${i + 1}: ${list[i]} guesses');
        }
        return;
      } else if (play == 'y' || play == 'Y') {
        break;
      }
    }
  }
}
