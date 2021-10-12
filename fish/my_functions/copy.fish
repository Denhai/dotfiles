function copy
  if command -sq pbcopy
    pbcopy
  else if command -sq xclip
    xclip -selection clipboard
  end
end
