#!/usr/bin/env ruby

# In .gitpod.yml should be call as `command` task, not `init`, once we want to change outside workspace folder
# See https://www.gitpod.io/docs/configure/projects/prebuilds#workspace-directory-only


def run_command(command)
  system(command)
end

def command_exists?(command)
  system("command -v #{command} >/dev/null 2>&1")
end

# Check if Zsh is installed
if !command_exists?("zsh")
  puts "Zsh not found. Installing Zsh..."
  run_command("sudo apt update && sudo apt install zsh -y")
else
  puts "Zsh is already installed."
end

# Set Zsh as the default shell
run_command("sudo chsh -s $(which zsh)")

# Install Oh My Zsh
if !File.directory?(File.expand_path("~/.oh-my-zsh"))
  puts "Installing Oh My Zsh..."
  run_command('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended')
else
  puts "Oh My Zsh is already installed."
end

# Changes to Oh My Zsh
run_command("zsh")
