source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
    fastfetch
end

starship init fish | source
zoxide init --cmd cd fish | source
source ~/.alias

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

if status is-interactive
and not set -q TMUX
    exec tmux
end

# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/home/janek/.cache/coursier/arc/https/github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.9%252B10/OpenJDK21U-jdk_x64_linux_hotspot_21.0.9_10.tar.gz/jdk-21.0.9+10"
set -gx PATH "$PATH:/home/janek/.cache/coursier/arc/https/github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.9%252B10/OpenJDK21U-jdk_x64_linux_hotspot_21.0.9_10.tar.gz/jdk-21.0.9+10/bin"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/janek/.local/share/coursier/bin"
# <<< coursier install directory <<<
