var args = process.argv;

var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();
today = mm + '/' + dd + '/' + yyyy;




// print process.argv

var scoreNum = args[2];
var nameString = args[3];
var dateString = today;
var gameString = args[4];


var fs = require('fs');
fs.readFile('./mygame/scoreData.json',function(err,content){
  if(err) throw err;
  var parseJson = JSON.parse(content);
    var index = parseJson.entries.length + 1;
    var scoreID = index;

    parseJson.entries.push({"scoreID": scoreID,"score": scoreNum,"name": nameString, "date": dateString, "game": gameString});

  fs.writeFile('./mygame/scoreData.json',JSON.stringify(parseJson),function(err){
    if(err) throw err;
  })
})


