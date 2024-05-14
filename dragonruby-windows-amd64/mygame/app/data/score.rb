#adds points to the score, each target hit is 100 points plus a bonus based on how quick the targets were clicked
def updateScore args
  scoreBonus = 10 * ("%.2f" % args.state.roundTime.fdiv(60)).to_i
  args.state.scoreNum += (100 + scoreBonus)
end

#subtracts 50 points from the score
def detractScore args
  args.state.scoreNum -= 50
end