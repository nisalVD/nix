{ config, pkgs, userSettings, ... }: 
let 
  tmux-tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-tokyo-night";
      rtpFilePath = "tokyo-night.tmux";
      version = "unstable-2023-09-11";
      src = pkgs.fetchFromGitHub {
        owner = "janoamaral";
        repo = "tokyo-night-tmux";
        rev = "9bba871bd7af93026715b5b232fa3e9e3d9e7a01";
        sha256 = "sha256-R1t6E5Dd3Zq0MPdXnYyvU0+juC2/0pt6r+Hi3QeMKm4=";
      };
    };
in
{
  home.packages = [
    pkgs.fzf
    (import ../scripts/tmux-fzf.nix {inherit pkgs userSettings;})
  ];

  programs.tmux = {
    enable = true;
    shortcut = "a";
    terminal = "tmux-256color";
    keyMode = "vi";
    plugins = with pkgs; [
      tmux-tokyo-night
      # {
        # plugin = (pkgs.tmuxPlugins.catppuccin.overrideAttrs ( _: {
        #     src = pkgs.fetchFromGitHub {
        #     owner = "catppuccin";
        #     repo = "tmux";
        #     rev = "a0119d25283ba2b18287447c1f86720a255fb652";
        #     sha256 = "sha256-SGJjDrTrNNxnurYV1o1KbHRIHFyfmbXDX/t4KN8VCao=";
        #   };
        # }));
        # extraConfig = ''
        #   set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha
        #   set -g @catppuccin_status_modules_right "session"
        #   set -g @catppuccin_window_default_text "" # use "#W" for application instead of directory
        # '';
      # }
    ];
    extraConfig = ''
# Address vim mode switching delay (http://superuser.com/a/252717/65504)
      set -s escape-time 0

# Increase scrollback buffer size from 2000 to 50000 lines
      set -g history-limit 50000

# Increase tmux messages display duration from 750ms to 4s
      set -g display-time 4000

# Refresh 'status-left' and 'status-right' more often, from every 15s to 5s
      set -g status-interval 5

# Emacs key bindings in tmux command prompt (prefix + :) are better than
# vi keys, even for vim users
      set -g status-keys emacs

# Focus events enabled for terminals that support them
      set -g focus-events on

# Super useful when using "grouped sessions" and multi-monitor setup
      setw -g aggressive-resize on

bind-key -r p run-shell "tmux neww tmux-fzf-projects"
bind C-j display-popup -E "tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t"

# split window and fix path for tmux 1.9
    bind = split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"

    set -as terminal-features ",xterm-256color:RGB"
# enable mouse support for switching panes/windows
    set -g mouse on
# copying for tmux
    bind -T copy-mode-vi v send-keys -X begin-selection
    bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'

# pane movement shortcuts
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    bind -r C-h select-window -t :-
    bind -r C-l select-window -t :+

# Resize pane shortcuts
    bind -r ^ last-window
    bind -r H resize-pane -L 10
    bind -r J resize-pane -D 10
    bind -r K resize-pane -U 10
    bind -r L resize-pane -R 10
 '';
  };
}
