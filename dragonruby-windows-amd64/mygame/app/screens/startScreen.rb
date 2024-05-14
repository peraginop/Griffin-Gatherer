
def startScreen args

    #creates a button to start the game
    args.state.btnStart.border ||= { x: 500, y: 280, w: 150, h: 60, r: 255, g: 255, b: 0}
    args.state.btnStart.label ||= { x: 510, y: 330, text: "Start!", size_enum: 15, align: 0, r: 255, g: 255, b: 0}
    
    args.outputs.borders << args.state.btnStart.border
    args.outputs.labels << args.state.btnStart.label

    #creates a label to display the score
    args.state.currScore.label ||= { x: 25, y: 700, text: "Current Score: #{args.state.scoreNum.to_s}", size_enum: 4, r: 255, g: 255, b: 0 }

    args.outputs.labels << args.state.currScore.label

    #
    instText = "Click on the griffins to increase your score click as fast as you can to get a bonus to your score, but Watch Out! If you miss a griffin, your score lowers by 50 points. \n  
                There are ten rounds in total each lasting 10 seconds, a round ends after all 3 griffins are teleported or the 10 seconds are up. After 10 rounds the game is over 
                and you can upload your score to the highscores website. \n \n The music can be turned on and off 
                by clicking on the speaker icon at the bottom right."
    instTextFormatted = args.string.wrapped_lines(instText, 25)

    args.outputs.labels << instTextFormatted.map_with_index do |s, i|
      {
        x: 25,
        y: 650 - (i * 25),
        text: s,
        r: 255,
        g: 255,
        b: 0
      }
    end

    storyText = "The Story: You are Iffyn, Wizard & Griffin Keeper, and your prized flock of brown, white, & pink griffins has broken out of their pen! After repairing their pen, you set off to catch all 30 griffins and send them back with the help of a teleportation spell."
    storyTextFormatted = args.string.wrapped_lines(storyText, 25)

    args.outputs.labels << storyTextFormatted.map_with_index do |s, i|
      {
        x: 1000,
        y: 650 - (i * 25),
        text: s,
        r: 255,
        g: 255,
        b: 0

      }
    end

    if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.btnStart.border)
      args.state.gameScreen = 1
      args.state.targetOn = 1
      startRound args
    end
end