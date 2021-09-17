function diary
    echo "Enter your filename"
    read line
    touch (date -I)-$line.md
end
