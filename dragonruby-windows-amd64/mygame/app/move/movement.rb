
#first checks if the targets hitboxes have been hit. if they have not been hit, the targets positions are updated and then displayed
def moveTargets(args)

  args.state.roundTime -= 1



  if (args.state.target1[:hit] == false)
    args.state.target1[:x] += args.state.target1[:dx]
    args.state.target1[:y] += args.state.target1[:dy]
    bounce(args, args.state.target1)

    args.state.target1Border.border[:x] = args.state.target1[:x]
    args.state.target1Border.border[:y] = args.state.target1[:y]
    
    args.outputs.borders << args.state.target1Border.border
    
    args.outputs.sprites << { x: args.state.target1.x, y: args.state.target1.y, w: 48, h: 48,
       path: "sprites/birds/#{args.state.target1.currColor.to_s}#{0.frame_index 4, 6, true}.png", flip_horizontally: args.state.target1.dx < 0 }

  end

  if (args.state.target2[:hit] == false)
    args.state.target2[:x] += args.state.target2[:dx]
    args.state.target2[:y] += args.state.target2[:dy]
    bounce(args, args.state.target2)

    args.state.target2Border.border[:x] = args.state.target2[:x]
    args.state.target2Border.border[:y] = args.state.target2[:y]
    
    args.outputs.borders << args.state.target2Border.border

    args.outputs.sprites << { x: args.state.target2.x, y: args.state.target2.y, w: 48, h: 48,
       path: "sprites/birds/#{args.state.target2.currColor.to_s}#{0.frame_index 4, 6, true}.png", flip_horizontally: args.state.target2.dx < 0 }

  end

  if (args.state.target3[:hit] == false)
    args.state.target3[:x] += args.state.target3[:dx]
    args.state.target3[:y] += args.state.target3[:dy]
    bounce(args, args.state.target3)

    args.state.target3Border.border[:x] = args.state.target3[:x]
    args.state.target3Border.border[:y] = args.state.target3[:y]
    
    args.outputs.borders << args.state.target3Border.border

    args.outputs.sprites << { x: args.state.target3.x, y: args.state.target3.y, w: 48, h: 48,
       path: "sprites/birds/#{args.state.target3.currColor.to_s}#{0.frame_index 4, 6, true}.png", flip_horizontally: args.state.target3.dx < 0 }

  end  

end

#when targets hit the game screen bounds, they bounce off by changing the sign of the targets dx or dy
#the targets dx/dy also increases making them become faster as they bounce more
def bounce args, location
  if (location.x > args.state.gameEdges.right)
    location.dx *= -1
    if (location.dx > 0)
      location.dx += 1
    elsif (location.dx < 0)
      location.dx -= 1
    end
  end

  if (location.x < args.state.gameEdges.left)
    location.dx *= -1
    if (location.dx > 0)
      location.dx += 1
    elsif (location.dx < 0)
      location.dx -= 1
    end
  end

  if (location.y < args.state.gameEdges.bottom) 
    location.dy *= -1
    if (location.dy > 0)
      location.dy += 1
    elsif (location.dy < 0)
      location.dy -= 1
    end
  end

  if (location.y > args.state.gameEdges.top)
    location.dy *= -1
    if (location.dy > 0)
      location.dy += 1
    elsif (location.dy < 0)
      location.dy -= 1
    end
  end
end

#randomizes the direction and speed of the targets
def randomizeSpeedDir args, target
  randomNum = (Math.rand * 3).to_i
  if (randomNum == 0)
    target.dx = Math.rand * 3 + 3
    target.dy = Math.rand * 3 + 3
  elsif (randomNum == 1)
    target.dx = -1 * (Math.rand * 3 + 3)
    target.dy = Math.rand * 3 + 3
  elsif (randomNum == 2)
    target.dx = -1 * (Math.rand * 3 + 3)
    target.dy = -1 * (Math.rand * 3 + 3)
  elsif (randomNum == 4)
    target.dx = Math.rand * 3 + 3
    target.dy = -1 * (Math.rand * 3 + 3)
  end
end
