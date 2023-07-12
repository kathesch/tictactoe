const data = { username: 'John', password: '123456' };

url = "http://127.0.0.1:8080/json"
async function sendJson() {
    const request = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        mode: "no-cors",
        body: JSON.stringify(data)
      })
    const words = await request
    console.log(words)
}

sendJson()