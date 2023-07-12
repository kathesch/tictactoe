// let boardState = {
//   rows: 4,
//   columns: 4,
// };

// let jsonBoardState = JSON.stringify(boardState);

// let xhr = new XMLHttpRequest();

// xhr.open("POST", "http://127.0.0.1:8080/display");
// xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// xhr.send("hello");

// let xhr2 = new XMLHttpRequest();
// url = "http://127.0.0.1:8080/data";
// xhr2.open("GET", url);

// xhr2.send();
// //window.location.href = url;

// const response = fetch(url)
//   .then((res) => {
//     //console.log(res.text())
//     return res;
//   })
//   .catch((e) => {
//     return "hello";
//   });

// url = "http://127.0.0.1:8080/data";

// async function getWords() {
//     const response = await fetch(url);
//     const words = await response.text();
//     console.log(words); // Unwrapped result
//     return words;
// }

// const data = { username: 'John', password: '123456' };

// (async () => {
//     await fetch(url, {
//         method: 'POST',
//         headers: {
//           'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(data)
//       })
// })()

const data = { username: 'John', password: '123456' };

url2 = "http://127.0.0.1:8080/json"
async function sendJson() {
    const request = await fetch(url2, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        mode: "no-cors",
        body: JSON.stringify(data)
      })
    const words = await response
    console.log(words)
    return words
}

sendJson()
