
def expTarg args
   

	
    if (args.state.target1[:exp] == true) && (args.state.target1[:hit] == true)
        args.outputs.sprites << { x: args.state.target1.x - 50, y: args.state.target1.y - 0, w: 128, h: 176, path: "sprites/db/db#{args.state.start_looping_at.frame_index 8, 5, false}.png" }
    end
    if (args.state.target2[:exp] == true) && (args.state.target2[:hit] == true)
        args.outputs.sprites << { x: args.state.target2.x - 50, y: args.state.target2.y - 0, w: 128, h: 176, path: "sprites/db/db#{args.state.start_looping_at.frame_index 8, 5, false}.png" }
    end
    if (args.state.target3[:exp] == true) && (args.state.target3[:hit] == true)
        args.outputs.sprites << { x: args.state.target3.x - 50, y: args.state.target3.y - 0, w: 128, h: 176, path: "sprites/db/db#{args.state.start_looping_at.frame_index 8, 5, false}.png" }
    end
end

def switchExp args
    if (args.state.target1.expTime <= 0)
        args.state.target1.exp = false
        args.state.target1.expTime = 30
    end
    if (args.state.target2.expTime <= 0)
        args.state.target2.exp = false
        args.state.target2.expTime = 30
    end
    if (args.state.target3.expTime <= 0)
        args.state.target3.exp = false
        args.state.target3.expTime = 30
    end
end

def tickExp args
    if (args.state.target1[:exp] == true)
        args.state.target1.expTime -= 1
    end
    if (args.state.target2[:exp] == true)
        args.state.target2.expTime -= 1
    end
    if (args.state.target3[:exp] == true)
        args.state.target3.expTime -= 1
    end
end

def renderExp args
    expTarg(args)
    tickExp(args)
    switchExp(args)
end