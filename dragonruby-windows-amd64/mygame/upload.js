var neocities = require('neocities')
//the api for neocities requires a user's username and password to work
//as I do not want to make my websites login information publically available, I have put a fake username and password
//when provided with valid login information, this does work
var api = new neocities('myUsername', 'myPassword')

api.upload([
  {name: 'scoreData.json', path: './mygame/scoreData.json'}
], function(resp) {
  console.log(resp)
})