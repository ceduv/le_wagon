def tell(who, &message_blk)
  "#{who}, #{message_blk.call}!" # rubocop:disable RedundantBlockCall
end

def tell_mum(&message_blk)
  tell("mum", &message_blk)
end

# Example:
# tell_mum {"I love you"}

def tell_with_proc(who, message_blk)
  "#{who}, #{message_blk.call}!"
end

def tell_mum_with_proc(message_blk)
  # TODO: return message addressed to your mum
  # => Should call #tell_with_proc of course
  tell_with_proc("mum", message_blk)
end

# Example:
# love_block = Proc.new {"I love you"}
# tell_mum_with_proc(love_block)
