
def changeBG args
    if args.state.roundNum <= 10
        args.state.background.sprites[:path] = "sprites/backgrounds/#{args.state.roundNum}.png"
    end
end