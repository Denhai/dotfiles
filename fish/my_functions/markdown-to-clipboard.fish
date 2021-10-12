function markdown-to-clipboard
  pandoc $argv | xclip -selection clipboard -target text/html;
end
