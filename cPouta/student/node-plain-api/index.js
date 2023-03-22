const http = require("http")

const host = '0.0.0.0'
const port = 3000

const requestListener = function (req, res) {
    res.setHeader("Content-Type", "application/json")

    const data = { foo: "Hello!", bar: [1,2,3] }

    res.end(JSON.stringify(data))

};

const server = http.createServer(requestListener)
server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`)
});
