if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting

    fish_vi_key_bindings
    starship init fish | source
end
