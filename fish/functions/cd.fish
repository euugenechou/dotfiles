function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd "$argv"; and ls
    end
end

