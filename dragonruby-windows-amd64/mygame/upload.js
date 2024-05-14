var neocities = require('neocities')
var api = new neocities('paulsprojects', 'Comp296!')

api.upload([
  {name: 'scoreData.json', path: './mygame/scoreData.json'}
], function(resp) {
  console.log(resp)
})