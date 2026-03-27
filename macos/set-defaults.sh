#!/bin/bash
# Sets reasonable macOS defaults for engineers.
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh or run `dot` to apply.

# --- Finder ---

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
# Show the ~/Library folder
chflags nohidden ~/Library
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Show path bar (breadcrumb at bottom)
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Show drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Show the home folder when opening a new Finder window
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# --- System ---

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Disable "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Reduce fullscreen animation duration
defaults write -g NSWindowResizeTime -float 0.001

# --- Dock ---

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
# Hide recent apps from Dock
defaults write com.apple.dock show-recents -bool false
# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# --- Hot corners ---

# Bottom left → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
# Top right → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

# --- Keyboard & Input ---

# Enable full keyboard access for all controls (Tab in dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# --- Screenshots ---

# Save screenshots to ~/Screenshots
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"
# Save screenshots as PNG
defaults write com.apple.screencapture type -string "png"
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# --- Kill affected applications ---

for app in "Finder" "Dock" "SystemUIServer"; do
  killall "$app" > /dev/null 2>&1
done

echo "Done. Some changes may require a logout/restart to take effect."
