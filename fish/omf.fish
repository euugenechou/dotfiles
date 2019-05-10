# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "$HOME/.config/fish/conf.d"

# Load Oh My Fish configuration.
for CONFIG_FILE in *.fish
  if [ $CONFIG_FILE != "omf.fish" ]
    source $CONFIG_FILE
  end
end

source $OMF_PATH/init.fish
