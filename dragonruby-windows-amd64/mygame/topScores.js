var array=[]
   

var fs = require('fs');
//Reads the data in scoreData.json
fs.readFile('./mygame/scoreData.json', function(err,content){
    if(err) throw err;

    var parseJson = JSON.parse(content);
    var text = "";

    //Copys the entries from parseJson into an array, then sorts that array
    for(a in parseJson.entries){
        array.push([parseJson.entries[a]])
    };

    array.sort(function(a,b){
        return b[0].score - a[0].score;
        });
    console.log(array[0][0].score);

    //Clears the topScores.txt file
    fs.writeFile('./mygame/topScores.txt', text,function(err){
        if(err) throw err;

    })

    
    //Loops 5 times, each time appending the appropriate scores
    for (var i = 0; i < (5); i++) {

        text = "#"+ (i+1) + " Score: " + array[i][0].score + ", Name: " + array[i][0].name + ", Date: " + array[i][0].date + "\n"

        fs.appendFileSync('./mygame/topScores.txt', text,function(err){
            if(err) throw err;
    
        })
    }
    i = 0
})