#updates the timers display
def displayTimer args
    if (args.state.roundTime > 0)
      args.outputs.labels << {x: 25, y: 500, text: "Time Left: " + "%.2f" % args.state.roundTime.fdiv(60), size_enum: 3, r: 255, g: 255, b: 0}
    else
      return
    end

end