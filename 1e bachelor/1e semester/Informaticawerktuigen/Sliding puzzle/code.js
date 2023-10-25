//Interne voorstelling van de puzzel als een tweedimensionale lijst
let my_puzzle = [[0, 1, 2],
              [7, 4, 8],
              [3, 5, 6]];

//Wanneer de volledige HTML-pagina geladen is wordt onderstaande functie uitgevoerd
window.onload = function(){
    draw_puzzle(my_puzzle);
}

//Deze functie neemt als invoer de lijstrepresentatie van onze puzzel
//
function draw_puzzle(puzzle){
    let puzzle_html = generate_puzzle_html(puzzle);
    document.getElementById("puzzle_container").innerHTML = puzzle_html;
}

function generate_puzzle_html(puzzle){
    //TODO: Implementeer deze functie!
    //puzzle bevat een tweedimensionale lijst die de sliding puzzle voorstelt
    //Kijk naar de functie generate_board_html in voorbeeld 7 uit het hoorcollege voor inspiratie
    const table = document.createElement("table");

    for (let i = 0; i < 3; i++) {
        let row = document.createElement("tr");

        for (let j = 0; j < 3; j++) {
            let cell = document.createElement("td");

            if (puzzle[i][j] !== 0) {
                let data = document.createTextNode(puzzle[i][j]);
                cell.appendChild(data);
            }
            else {
                cell.setAttribute('id', 'empty');
            }
            
            cell.addEventListener("click", (event) => {square_click_handler(event.target)})
            row.appendChild(cell);
        }
        
        table.appendChild(row);
    }

    let div = document.createElement('div');
    div.appendChild(table);
    return div.innerHTML;
}

function check_game_complete(puzzle) {

}

function swap_empty_square(puzzle, row, col) {

}

function square_click_handler(cell) {
    
}