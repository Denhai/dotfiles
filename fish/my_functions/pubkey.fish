function pubkey
  if command -sq pbcopy
    pbcopy < ~/.ssh/id_rsa.pub | cat ~/.ssh/id_rsa.pub
  else if command -sq xclip
    more ~/.ssh/id_rsa.pub | xclip -selection clipboard | cat ~/.ssh/id_rsa.pub
  end
end
