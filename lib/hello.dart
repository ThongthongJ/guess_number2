import 'dart:io';
import 'package:guess_number2/game.dart';

void main() {
  List<int> list = [];

  while (true) {

    stdout.write('Enter a maximum number to random : ');
    var inmax = stdin.readLineSync();
    var maxRan = 100;
    var game = Game();

    if (inmax!.isNotEmpty) {
        maxRan = int.tryParse(inmax)!;
        game = Game(maxRandom: maxRan);
    }

    int result = 0;
    int count_guess = 0;

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
      count_guess++;

      if (result == 1) {
        print('║ $guess is too High ▲');
      } else if (result == 2) {
        print('║ $guess is too Low ▼');
      } else if (result == 3) {
        print('║ $guess is Correct ♥, TOTAL GUESSES : $count_guess');
        
        list.add(count_guess);
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
