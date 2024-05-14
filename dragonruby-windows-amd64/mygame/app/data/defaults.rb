

#creates default values for the tracked variables
def defaults(args)
    #default values for the up-to-date score downloading
    args.state.fileRefreshed ||= 1
    args.state.download ||= nil
  
    #default values for the score entry data
    args.state.scoreNum ||= 0;
    args.state.nameString ||= "JaneDoe" 
    args.state.gameString ||= "GriffinGatherer"
    args.state.text_box_message ||= ""
    args.state.textBoxID ||= 0
    args.state.gameScreen ||= 0
    args.state.nameInputted ||= 0
    args.state.gameStarted ||= 0
  
    #default values for the 3 targets
    args.state.target1 ||= {x: 460, y: 470, w: 48, h: 48, dx: 4, dy: 4, path: 'sprites/square/orange.png', hit: false, exp: false, expTime: 30, currColor: ""}
    args.state.target2 ||= {x: 560, y: 470, w: 48, h: 48, dx: 4, dy: 4, path: 'sprites/square/violet.png', hit: false, exp: false, expTime: 30, currColor: ""}
    args.state.target3 ||= {x: 660, y: 470, w: 48, h: 48, dx: 4, dy: 4, path: 'sprites/square/green.png', hit: false, exp: false, expTime: 30, currColor: ""}
    
    #creates hitboxes for the targets that are slightly larger than the sprites to make clicking on them easier
    args.state.target1Border.border ||= {x: 460, y: 470, w: 52, h: 52, r: 0, g: 0, b: 0, a: 0}
    args.state.target2Border.border ||= {x: 460, y: 470, w: 52, h: 52, r: 0, g: 0, b: 0, a: 0}
    args.state.target3Border.border ||= {x: 460, y: 470, w: 52, h: 52, r: 0, g: 0, b: 0, a: 0}
    args.state.targetOn ||= 0
  
    #default values to determine the boundaries of the game screen
    args.state.gameEdges.top ||= 680 
    args.state.gameEdges.bottom ||= 0
    args.state.gameEdges.left ||= 300
    args.state.gameEdges.right ||= 910
  
    #default values for starting rounds
    args.state.roundNum ||= 0
    args.state.roundTime ||= 10 * 60
  
    #default values for the background music
    args.state.musicStarted ||= 0

    #default vaules for background sprite
    args.state.background.sprites ||= {x: 300, y: 0, w: 650, h: 720, path: 'sprites/backgrounds/1.png'} 

  end
  
  
  