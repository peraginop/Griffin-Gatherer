
#resets the targets positions & hit status, adds to the roundNum count, resets the round timer, then displays the targets
def startRound(args)
  
    args.state.target1[:hit] = false
    args.state.target2[:hit] = false
    args.state.target3[:hit] = false
  
    args.state.target1[:x] = Math.rand * 500 + 370
    args.state.target1[:y] = Math.rand * 680
    randomizeSpeedDir(args, args.state.target1)
  
    args.state.target2[:x] = Math.rand * 500 + 370
    args.state.target2[:y] = Math.rand * 680
    randomizeSpeedDir(args, args.state.target2)
    
    args.state.target3[:x] = Math.rand * 500 + 370
    args.state.target3[:y] = Math.rand * 680
    randomizeSpeedDir(args, args.state.target3)
  
    #randomizes the icons for fun
    iconRandomizer(args, args.state.target1)
    iconRandomizer(args, args.state.target2)
    iconRandomizer(args, args.state.target3)
  
    args.state.roundNum += 1
    args.state.roundTime = 10 * 60

    changeBG(args)
  
  
    #args.outputs.sprites << args.state.target1
    #args.outputs.sprites << args.state.target2
    #args.outputs.sprites << args.state.target3
    
  end