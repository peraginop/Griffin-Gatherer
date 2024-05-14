require 'app/move/movement.rb'
require 'app/input/keys.rb'
require 'app/data/rounds.rb'
require 'app/data/score.rb'
require 'app/data/icon.rb'
require 'app/data/timer.rb'
require 'app/data/defaults.rb'
require 'app/screens/startScreen.rb'
require 'app/screens/playScreen.rb'
require 'app/screens/uploadScreen.rb'
require 'app/sound/sounds.rb'
require 'app/anim/exp.rb'
require 'app/anim/bg.rb'

def tick args

  defaults(args)

  # downloads the latest version of the database
  onStart args, args.state.fileRefreshed
  
  if !args.state.download.nil?
    if args.state.download[:complete]
      if args.state.download[:http_response_code] == 200
        $gtk.write_file "scoreData.json", args.state.download[:response_data]
      end
      args.gtk.system 'node "./mygame/topScores.js"'
      args.state.download = nil
    end
  end
  
  #Creates a border around the space where the game will be played
  args.state.gameView.border ||= { x: 300, y: 0, w: 650, h: 720 }

  #Creates the background for the game space, and the sprite for the volume speaker
  args.state.speaker.sprites ||= {x: 1180, y: 10, w: 90, h: 82, path: 'sprites/ui/on.png', on: 1}

  args.outputs.borders << args.state.gameView.border
  args.outputs.sprites << args.state.background.sprites
  args.outputs.sprites << args.state.speaker.sprites

  #sets the background color
  args.outputs.background_color = [187, 153, 255]

  
  #changes which screen is displayed depending on the gameScreen value
  case args.state.gameScreen
  when 0
    #Start Screen
    startScreen(args)
  when 1
    startMusic(args)
    
    #Game Screen
    playScreen(args)
    changeVolume(args)
  when 2
    #Game Over Screen / Upload Screen
    uploadScreen(args)
    changeVolume(args)
  end 
  
	
  #opens the console when the forward slash key is hit
  if args.inputs.keyboard.forward_slash
   args.gtk.console.show
  end

  #switches the speaker sprite between on and off when clicked
  if (args.inputs.mouse.click) && (args.inputs.mouse.point.inside_rect? args.state.speaker.sprites)
    if (args.state.speaker.sprites[:on] == 1)
      args.state.speaker.sprites[:on] = 0
      args.state.speaker.sprites[:path] = 'sprites/ui/off.png'
    elsif (args.state.speaker.sprites[:on] == 0)
      args.state.speaker.sprites[:on] = 1
      args.state.speaker.sprites[:path] = 'sprites/ui/on.png'
    end
  end
end


#preps the game to download the lastest version of the database
def onStart args, int
  if (int == 1)

    #args.gtk.delete_file_if_exist "scoreData.json"
    
    if args.state.download.nil?
      args.state.download = $gtk.http_get 'https://paulsprojects.neocities.org/scoreData.json'
    end
  args.state.fileRefreshed = 0
  args.outputs.sounds << 'sounds/MusicLoop.wav'
  end
end

