
def playScreen args

      #creates a label to display the score & current round number
      args.state.currScore.label = { x: 25, y: 700, text: "Current Score: #{args.state.scoreNum.to_s}", size_enum: 4, r: 255, g: 255, b: 0 }
      args.state.currRound.label = { x: 25, y: 600, text: "Current Round: #{args.state.roundNum.to_s} / 10", size_enum: 2, r: 255, g: 255, b: 0 }

      args.outputs.labels << args.state.currScore.label
      args.outputs.labels << args.state.currRound.label

      #temporarily if the a key is pressed on the game screen, the new round starts
      if args.inputs.keyboard.key_down.a
        startRound args
        

      end

      #while targets are visible, the timer is updated & the targets move, explosion animations are also calculated & rendered
      if (args.state.targetOn == 1)
        
        displayTimer(args)
        renderExp(args)
        moveTargets(args)
        
      end

      #if a target's been clicked it gets it's variables updated, a sound plays, & the score increases
      #if a target hasn't been clicked & the mouse was inside the gamescreen then the score detracts
      if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.target1Border.border) && (args.state.target1.hit == false)
        args.state.target1.hit = true
        args.state.target1.exp = true
        args.state.target1.locGot = false
        updateScore args
        args.state.start_looping_at = args.state.tick_count
        args.outputs.sounds << 'sounds/clicked.wav'
      elsif (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.target2Border.border) && (args.state.target2.hit == false)
        args.state.target2.hit = true
        args.state.target2.exp = true
        args.state.target2.locGot = false
        updateScore args
        args.state.start_looping_at = args.state.tick_count
        args.outputs.sounds << 'sounds/clicked.wav'
      elsif (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.target3Border.border) && (args.state.target3.hit == false)
        args.state.target3.hit = true
        args.state.target3.exp = true
        args.state.target3.locGot = false
        updateScore args
        args.state.start_looping_at = args.state.tick_count
        args.outputs.sounds << 'sounds/clicked.wav'
      elsif (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.gameView.border)
        detractScore args
      end

      #after all the targets have been hit or the timer runs out, the next round starts and values are reset
      if ( ((args.state.target1[:hit] == true) && (args.state.target2[:hit] == true) && (args.state.target3[:hit] == true)) && ((args.state.target1[:exp] == false) && (args.state.target2[:exp] == false) && (args.state.target3[:exp] == false)) ) || (args.state.roundTime <= 0)
        startRound args
      end

      #after 10 rounds, the game ends and the screen switches to the highscore upload screen
      if (args.state.roundNum > 10)
        args.state.targetOn = 0
        args.state.gameScreen = 2
      end

end