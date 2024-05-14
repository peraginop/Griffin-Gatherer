def uploadScreen args
#creates buttons to set name value & link to website

    #creates default values for all the buttons and textboxes
    args.state.setName.border ||= { x: 50, y: 400, w: 120, h: 50, r: 255, g: 255, b: 0 }
    args.state.setName.label ||= { x: 60, y: 430, text: "Set Name", size_enum: 2, r: 255, g: 255, b: 0 }

    args.state.gameLink.border ||= { x: 980, y: 600, w: 285, h: 50, r: 255, g: 255, b: 0 }
    args.state.gameLink.label  ||= { x: 990, y: 630, text: "Go to Highscore Website", size_enum: 2, r: 255, g: 255, b: 0 }

    args.state.tBName.border ||= { x: 50, y: 500, w: 200, h: 50, r: 255, g: 255, b: 0}
    args.state.tBName.label ||= { x: 60, y: 530, text: "Enter Name", size_enum: 2, r: 255, g: 255, b: 0 }

    args.state.uploadButton.border ||= { x: 50, y: 300, w: 200, h: 50, r: 255, g: 255, b: 0 }
    args.state.uploadButton.label  ||= { x: 55, y: 330, text: "Upload Highscore", size_enum: 2, r: 255, g: 255, b: 0 }

    args.state.resetButton.border ||= { x: 50, y: 200, w: 150, h: 50, r: 255, g: 255, b: 0 }
    args.state.resetButton.label  ||= { x: 55, y: 230, text: "Reset Game", size_enum: 2, r: 255, g: 255, b: 0 }

    #Creates a textbox that has the most recent scores
    topText = args.gtk.read_file("topScores.txt")
    topTextFormatted = args.string.wrapped_lines(topText, 50)

    args.outputs.labels << {x: 475, y: 400, text: "High Scores", size_enum: 20, r: 255, g: 255, b: 0}
    args.outputs.labels << topTextFormatted.map_with_index do |s, i|
      {
        x: 400,
        y: 300 - (i * 50),
        text: s,
        r:255,
        g:255,
        b:0
      }
    end

    #renders the link to the website
    args.outputs.borders << args.state.gameLink.border
    args.outputs.labels << args.state.gameLink.label

    args.outputs.borders << args.state.resetButton.border
    args.outputs.labels << args.state.resetButton.label

    
    if (args.state.nameInputted == 0)
      #if a name has not been inputted then the textbox and buttons are still visible
      args.outputs.borders << args.state.tBName.border
      args.outputs.labels << args.state.tBName.label

      args.outputs.borders << args.state.setName.border
      args.outputs.labels << args.state.setName.label
    elsif (args.state.nameInputted == 1)
      #if a name has been inputted then the textbox and buttons disappear and the upload button becomes visible
      args.outputs.borders << args.state.uploadButton.border
      args.outputs.labels << args.state.uploadButton.label
    end

    #takes the history of keys inputted and concatinates a string
    keyInput(args)

    if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.tBName.border)
      args.state.text_box_message = ""
      args.state.textBoxID = 1
    end

    #determines if the set name button was clicked, then sets the nameString variable to the name in the textbox
    if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.setName.border) && (args.state.text_box_message != "")
      args.state.nameString = args.state.tBName.label.text
      args.state.nameInputted = 1
    end

    #resets the game
    if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.resetButton.border)
      args.gtk.reset_next_tick
    end

    #updates the textbox with text entered from the keyboard
    if (args.state.textBoxID == 1)
      args.state.tBName.label = { x: 60, y: 530, text: args.state.text_box_message }
    end

    #appends the newest entry to the json array & uploads the file to neocities using a console command to node.js
    if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.uploadButton.border)
      args.state.nameInputted = 2
      args.gtk.system 'node "./mygame/append.js" ' + "#{args.state.scoreNum} #{args.state.nameString} #{args.state.gameString}"
      args.gtk.system 'node "./mygame/upload.js"'
      args.gtk.system 'node "./mygame/topScores.js"'
    end

    #opens the link to the highscores page
    if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.gameLink.border)
      args.gtk.openurl "https://paulsprojects.neocities.org/"
    end
end