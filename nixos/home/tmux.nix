{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      tmuxPlugins.urlview
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.sensible
      tmuxPlugins.power-theme
    ];
  };

  # home-manager switch 后, 配置会生成目录 ~/.config/tmux/tmux.conf
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      unbind '"'
      bind - splitw -v -c '#{pane_current_path}' # 垂直方向新增面板，默认进入当前目录

      unbind %
      bind \\ splitw -h -c '#{pane_current_path}' # 水平方向新增面板，默认进入当前目录

      bind P pipe-pane -o "cat >>/tmp/tmux.log" \; display "Toggled logging to /tmp/tmux.log"

      set-option -g mouse on # 等同于以上4个指令的效果
      setw -g mode-keys vi # 开启vi风格后，支持vi的C-d、C-u、hjkl等快捷键
      bind -T copy-mode-vi v send-keys -X begin-selection # 绑定v键为开始选择文本

      # 设置window的起始下标为1
      set -g base-index 1

      # 设置pane的起始下标为1
      set -g pane-base-index 1

      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # 关闭默认窗口标题
      set -g set-titles off

      # set -g default-shell /bin/zsh
      # set -g default-command /bin/zsh

      # 绑定hjkl键为面板切换的上下左右键
      bind k select-pane -U # 绑定k为↑
      bind j select-pane -D # 绑定j为↓
      bind h select-pane -L # 绑定h为←
      bind l select-pane -R # 绑定l为→

      bind -r e lastp # 选择最后一个面板
      bind -r ^e last # 选择最后一个窗口
      bind -r ^u swapp -U # 与前一个面板交换位置
      bind -r ^d swapp -D # 与后一个面板交换位置

      # 绑定Ctrl+hjkl键为面板上下左右调整边缘的快捷指令
      bind -r ^k resizep -U 10 # 绑定Ctrl+k为往↑调整面板边缘10个单元格
      bind -r ^j resizep -D 10 # 绑定Ctrl+j为往↓调整面板边缘10个单元格
      bind -r ^h resizep -L 10 # 绑定Ctrl+h为往←调整面板边缘10个单元格
      bind -r ^l resizep -R 10 # 绑定Ctrl+l为往→调整面板边缘10个单元格

      # buffer缓存复制到Linux系统粘贴板
      bind C-c run "tmux save-buffer - | xsel -i --clipboard"

      # Linux系统粘贴板内容复制到会话
      bind C-v run "tmux set-buffer \"$(xsel -o --clipboard)\"; tmux paste-buffer"

      run-shell ${pkgs.tmuxPlugins.urlview}/share/tmux-plugins/urlview/urlview.tmux

      run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux
      set -g @resurrect-capture-pane-contents 'on'
      set -g @resurrect-strategy-vim 'session'

      run-shell ${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux
      set -g @continuum-restore 'on'

      run-shell ${pkgs.tmuxPlugins.power-theme}/share/tmux-plugins/power/tmux-power.tmux
      set -g @tmux_power_theme 'everforest'
    '';
  };
}
