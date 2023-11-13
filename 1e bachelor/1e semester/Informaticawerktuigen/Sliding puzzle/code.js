//Interne voorstelling van de puzzel als een tweedimensionale lijst
let totalSeconds = 0;
let size = 3;
let my_puzzle = [
  [0, 1, 2],
  [7, 4, 8],
  [3, 5, 6],
];

//Wanneer de volledige HTML-pagina geladen is wordt onderstaande functie uitgevoerd
window.onload = function () {
  new_game();
  setInterval(setTime, 1000);
};


function setTime() {
    totalSeconds++;
    let minutes = Math.floor(totalSeconds / 60);
    let remainingSeconds = totalSeconds - (minutes * 60);
    
    if (minutes < 10) {
        document.getElementById("minutes").innerHTML = '0' + minutes;
    }
    else {
        document.getElementById("minutes").innerHTML = minutes;
    }
    
    if (remainingSeconds < 10) {
        document.getElementById("seconds").innerHTML = '0' + remainingSeconds;
    }
    else {
        document.getElementById("seconds").innerHTML = remainingSeconds;
    }
}

//Deze functie neemt als invoer de lijstrepresentatie van onze puzzel
//
function new_game() {
  randomize_puzzle(size);
  draw_puzzle(my_puzzle);
  totalSeconds = 0;
}

function puzzle_size_handler(value) {
  size = value;
  new_game();
}

function draw_puzzle(puzzle) {
  let puzzle_html = generate_puzzle_html(puzzle);
  document.getElementById("puzzle_container").innerHTML = puzzle_html;
}

function generate_puzzle_html(puzzle) {
  //TODO: Implementeer deze functie!
  //puzzle bevat een tweedimensionale lijst die de sliding puzzle voorstelt
  //Kijk naar de functie generate_board_html in voorbeeld 7 uit het hoorcollege voor inspiratie
  const table = document.createElement("table");

  for (let i = 0; i < size; i++) {
    let row = document.createElement("tr");

    for (let j = 0; j < size; j++) {
      let cell = document.createElement("td");
      cell.setAttribute("data-row", i);
      cell.setAttribute("data-col", j);
      cell.setAttribute("onclick", "square_click_handler(this)");

      if (puzzle[i][j] !== 0) {
        let data = document.createTextNode(puzzle[i][j]);
        cell.appendChild(data);
      } else {
        cell.setAttribute("class", "emptyTile");
      }

      row.appendChild(cell);
    }

    table.appendChild(row);
  }

  let div = document.createElement("div");
  div.appendChild(table);
  return div.innerHTML;
}

function check_game_complete(puzzle) {
  for (let row = 0; row < size; row++) {
    for (let col = 0; col < size; col++) {
      let correct = row * size + col + 1;

      if (
        (correct !== size * size && puzzle[row][col] !== correct) ||
        (correct === size * size && puzzle[row][col] !== 0)
      ) {
        return false;
      }
    }
  }

  return true;
}

function swap_empty_square(puzzle, row, col) {
  if (row > 0 && puzzle[row - 1][col] === 0) {
    puzzle[row - 1][col] = puzzle[row][col];
    puzzle[row][col] = 0;
    draw_puzzle(puzzle);
  }

  if (row < size - 1 && puzzle[row + 1][col] === 0) {
    puzzle[row + 1][col] = puzzle[row][col];
    puzzle[row][col] = 0;
    draw_puzzle(puzzle);
  }

  if (col > 0 && puzzle[row][col - 1] === 0) {
    puzzle[row][col - 1] = puzzle[row][col];
    puzzle[row][col] = 0;
    draw_puzzle(puzzle);
  }

  if (col < size - 1 && puzzle[row][col + 1] === 0) {
    puzzle[row][col + 1] = puzzle[row][col];
    puzzle[row][col] = 0;
    draw_puzzle(puzzle);
  }

  if (check_game_complete(puzzle)) {
    alert("You've won!");
  }
}

function square_click_handler(cell) {
  let row = parseInt(cell.getAttribute("data-row"));
  let col = parseInt(cell.getAttribute("data-col"));

  if (!isNaN(row) && !isNaN(col)) {
    swap_empty_square(my_puzzle, row, col);
    return "swapped";
  }
}

function randomize_puzzle(size) {
  let newPuzzle = generate_puzzle(size);
  my_puzzle = newPuzzle;
}

function generate_puzzle(size) {
  let puzzle = create2DArray(size);
  do {
    let integers = Array.apply(null, Array(size * size)).map(function (x, i) {
      return i;
    });

    for (let i = 0; i < size; i++) {
      for (let j = 0; j < size; j++) {
        let index = Math.floor(Math.random() * integers.length);
        puzzle[i][j] = integers[index];
        integers.splice(index, 1);
      }
    }
  } while (!check_valid_puzzle(puzzle));

  return puzzle;
}

function check_valid_puzzle(puzzle) {
  let inversions = 0;
  for (let i = 0; i < size; i++) {
    for (let j = 0; j < size; j++) {
      for (let a = i; a < size; a++) {
        for (let b = j + 1; b < size; b++) {
          if (puzzle[i][j] > puzzle[a][b]) {
            inversions++;
          }
        }
      }
    }
  }

  if (size % 2 != 0 && inversions % 2 == 0) {
    return true;
  } else if (size % 2 == 0 && inversions % 2 != 0) {
    return true;
  } else {
    return false;
  }
}

function create2DArray(size) {
  let array = [];
  for (let i = 0; i < size; i++) {
    let row = [];
    for (let j = 0; j < size; j++) {
      row.push(0);
    }
    array.push(row);
  }
  return array;
}
