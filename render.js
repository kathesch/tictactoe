let boardState = {
  data: [0, 0, 0, 0, 0, 0, 0, 0, 0],
};

function updateBoardState() {
  for (i = 0; i < 9; i++) {
    let box = document.getElementById(`box_${i}`);
    if (boardState.data[i] === 1) {
      box.innerHTML = "X";
    }
    if (boardState.data[i] === -1) {
      box.innerHTML = "O";
    }
    if (boardState.data[i] === 0) {
      box.innerHTML = "";
    }
  }
  console.log(boardState.data);
}

url = "http://127.0.0.1:8080/tic";
async function sendTic(data) {
  const request = await fetch(url, {
    method: "POST",
    body: JSON.stringify(data),
  });
  boardState = await request.json();
  //boardState = newBoardState
  console.log(boardState.data);
}

function update() {
  for (let i = 0; i < 9; i++) {
    let box = document.getElementById(`box_${i}`);

    box.addEventListener("click", async (event) => {
      boardState.data[i] = 1;
      await sendTic(boardState);
      updateBoardState();
      console.log(boardState.data);
    });
  }
}

update()
