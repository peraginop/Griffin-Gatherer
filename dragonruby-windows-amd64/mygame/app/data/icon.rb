
#randomizes the icons based on this list of 34 different sprites
def iconRandomizer args, target
  
    iconNum = (Math.rand * 3 + 1).to_i

    case iconNum
    when 1
        target[:currColor] = "brown"
    when 2
        target[:currColor] = "white"
    when 3
        target[:currColor] = "pink"
    end
  end