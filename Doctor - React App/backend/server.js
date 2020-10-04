const { Socket } = require('dgram');
const express = require ('express');
const app = express();
const server = require('http').Server(app);
const io = require('socket.io')(server)
const { v4:uuidv4 } = require('uuid');
const {ExpressPeerServer} = require('peer');
const peerServer = ExpressPeerServer(server, {
    debug:true
});
app.set('view engine', 'ejs');
app.use(express.static('public'));

app.use('/peerjs', peerServer);
app.get('/', (req, res) => {
    res.redirect(`/${uuidv4()}`);
})

app.get('/:patient', (req, res) => {
    res.render('patient', {patientId: req.params.patient})
})

io.on('connection', socket => {
    socket.on('join-patient', (patientId, userId) => {
        socket.join(patientId);
        socket.to(patientId).broadcast.emit("user-connected", userId);
        socket.on('message', (message) => {
            //send message to the same room
            io.to(patientId).emit('createMessage', message)
        })
    })
})

server.listen(process.env.PORT||3030);