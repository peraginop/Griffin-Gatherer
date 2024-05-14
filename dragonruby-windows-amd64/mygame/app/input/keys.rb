#takes the data of the keys inputted and makes them into a string that appends each time a key is pressed
def keyInput(args)
    key_information = args.inputs.keyboard.truthy_keys
    letter = if !args.inputs.text.empty?
      args.inputs.text.first
    else
      nil
    end
  
    if key_information.include?(:backspace) || key_information.include?(:delete)
      args.state.text_box_message = args.state.text_box_message.chop
    else
        if (args.state.text_box_message.length < 19)
            if key_information.include?(:space)
                args.state.text_box_message = args.state.text_box_message
              elsif letter
                args.state.text_box_message = args.state.text_box_message.concat(letter)
              end
        end
    end
  end