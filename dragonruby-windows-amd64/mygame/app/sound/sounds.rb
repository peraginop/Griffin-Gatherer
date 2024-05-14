def addSong args, path
  args.audio[0] = 
  {
    name: 'Background',
    input: path,
    x: 0,
    y: 0,
    z: 0.0,
    gain: 0.25,
    pitch: 1.0,
    looping: true,
    paused: false
  }
  end

def startMusic args
  if (args.state.musicStarted == 0)
    addSong(args, 'sounds/background.ogg')
    args.state.musicStarted = 1
  end
end

def changeVolume args
    a = args.audio[0]
    if (args.state.speaker.sprites[:on] == 1)
        a.gain = 0.25
      elsif (args.state.speaker.sprites[:on] == 0)
        a.gain = 0.0
      end
end
