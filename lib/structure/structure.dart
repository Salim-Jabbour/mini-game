// ignore_for_file: must_be_immutable

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class Structure extends Equatable {
  @override
  List<Object?> get props => gameArray;

  /*
     0: no wall
     1: wall
     5: rook(قلعة)
     6: king(target)
  */

  List<int> positionOfKing = [9, 9];

  String outPut = '';

  //for A star
  int heuristicValue = 9999999;

  List<List<int>> gameArray = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 1, 0, 0, 0, 0, 0],
  ];

  Structure();

  //to create new object
  factory Structure.copy({required Structure obj}) {
    return Structure();
  }

  // function to print the array
  // void printArray() {
  //   for (int i = 0; i < gameArray.length; i++) {
  //     print('${i + 1}: ${gameArray[i]} \n ');
  //   }
  // }

  // get Position Of Rook and put it in a list
  List<int> getPositionOfRook(int x, List<List<int>> list) {
    for (int i = 0; i < list.length; i++) {
      for (int j = 0; j < 16; j++) {
        if (x == list[i][j]) {
          return [i, j];
        }
      }
    }
    return [];
  }

  //this function returns every possible move in list
  List<List<int>> checkMoves(
      int row, int column, List<List<int>> list, bool isRook) {
    List<List<int>> tempList = [];
    if (column == 0) {
      if (isRook) {
        // print('Only To Right: ');
      }
      for (int j = 1; j < 16; j++) {
        if (list[row][j] == 0) {
          if (isRook) {
            // print('[${row + 1}][${j + 1}]');
          }
          tempList.add([row, j]);
        }
        if (list[row][j] != 0) {
          break;
        }
      }
    } else {
      if (isRook) {
        // print('To Left: ');
      }
      for (int j = column; j >= 0; j--) {
        if (list[row][j] == 0) {
          if (isRook) {
            // print('[${row + 1}][${j + 1}]');
          }
          tempList.add([row, j]);
        }

        if (list[row][j] != 0 && j != column) {
          break;
        }
      }
      if (isRook) {
        // print('To Right: ');
      }
      for (int j = column; j < 16; j++) {
        if (list[row][j] == 0) {
          if (isRook) {
            // print('[${row + 1}][${j + 1}]');
          }
          tempList.add([row, j]);
        }
        if (list[row][j] != 0 && j != column) {
          break;
        }
      }
    }
    if (isRook) {
      // print('\n Possible Moves:  $tempList');
      outPut = '\n Possible Moves:  $tempList';
    }
    if (!isRook) {
      outPut = '';
    }
    // print('\n OutPut:  $outPut');
    return tempList;
  }

  //function that returns true if you can move to this spot
  bool move(List<List<int>> coordinateList, List<int> tappedBlock) {
    for (int i = 0; i < coordinateList.length; i++) {
      if (tappedBlock[0] == coordinateList[i][0] &&
          tappedBlock[1] == coordinateList[i][1]) {
        return true;
      }
    }
    return false;
  }

  //to activate gravity
  bool goDown(Structure st, int rowOfRook, int columnOfRook) {
    late List<int> temp;
    bool down = false;

    for (int i = rowOfRook + 1; i < 10; i++) {
      if (isFinal(i, columnOfRook, st.gameArray)) {
        temp = [9, 9];
        st.gameArray[temp[0]][temp[1]] = 5;
        down = true;
        break;
      } else if (st.gameArray[i][columnOfRook] == 1 ||
          st.gameArray[i - 1][columnOfRook] == 6) {
        temp = [(i - 1), columnOfRook];
        st.gameArray[temp[0]][temp[1]] = 5;
        down = true;

        break;
      }
    }
    return down;
  }

  //deep copy
  Structure deepCopy(Structure st) {
    //creating new object in memory not referencing to the same location in memory
    Structure returnedStructure = Structure.copy(obj: st);
    //changing the location of castle
    // returnedStructure.gameArray[row][column] = 5;
    return returnedStructure;
  }

  //compare to objects
  static bool isEqual(Structure obj1, Structure obj2) {
    //tool for comparing two objects
    Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
    bool temp = unOrdDeepEq(obj1, obj2);

    return temp;
  }

  //get next State
  List<Structure> getNextState(Structure st) {
    List<Structure> nextStates = [];
    //to get all possible moves
    List<List<int>> possibleMoves = checkMoves(
      getPositionOfRook(5, st.gameArray)[0],
      getPositionOfRook(5, st.gameArray)[1],
      st.gameArray,
      false,
    );
    // looping in each element to make a new object and added to a list
    for (int i = 0; i < possibleMoves.length; i++) {
      Structure structure = st.deepCopy(st);
      //getting the position of rook and save it in temp variable as  [x,y]
      List<int> temp = getPositionOfRook(5, structure.gameArray);
      //then making it 0 to move the castle
      structure.gameArray[temp[0]][temp[1]] = 0;
      structure.gameArray[possibleMoves[i][0]][possibleMoves[i][1]] = 5;

      structure.heuristicValue =
          structure.h(structure, possibleMoves[i][0], possibleMoves[i][1]);

      structure.gameArray[possibleMoves[i][0]][possibleMoves[i][1]] = 0;
      // to make the rook goDown in
      goDown(structure, possibleMoves[i][0], possibleMoves[i][1]);

      nextStates.add(structure);
    }
    // printTheH(nextStates);
    return nextStates;
  }

  int h(Structure object, int rowOfRook, int columnOfRook) {
    int x = 55555;
    //list of many 1's and one 0
    List<int> temp = object.gameArray[rowOfRook + 1];
    if ((rowOfRook + 1) == 0) {
      return 0;
    }
    for (var i = 0; i < temp.length; i++) {
      if (temp[i] == 0) {
        x = (columnOfRook - i).abs() * 10;

        return x;
      }
    }
    return x;
  }

  //to check if you win or not in user play
  bool isFinal(int row, int column, List<List<int>> list) {
    if ((row == 9 || row == 7) && (column == 9 || column == 7)) {
      outPut = 'You Win ';

      return true;
    }
    return false;
  }

  //to check if you win or not in Algorithms
  bool isFinalAlgos(List<List<int>> list) {
    int row = getPositionOfRook(5, list)[0];
    int column = getPositionOfRook(5, list)[1];

    if ((row == 9 || row == 7) && column == 9) {
      outPut = 'You Win ';

      return true;
    }
    return false;
  }
}
