-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'neobones_dark'

config.colors = {
 scrollbar_thumb = '#999'
}

config.default_workspace = "main"

config.font = wezterm.font_with_fallback({
  {family = "Monaspace Neon", scale = 1.2},
  {family = "Inconsolata for Powerline", scale = 1.2},
  {family = "Operator Mono", scale = 1.2}
})

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'p',
    mods='CMD',
    action = act.ActivateCommandPalette
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Panes on main table
  { key = "s",          mods = "LEADER",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "v",          mods = "LEADER",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "h",          mods = "CTRL",      action = act.ActivatePaneDirection("Left") },
  { key = "j",          mods = "CTRL",      action = act.ActivatePaneDirection("Down") },
  { key = "k",          mods = "CTRL",      action = act.ActivatePaneDirection("Up") },
  { key = "l",          mods = "CTRL",      action = act.ActivatePaneDirection("Right") },
  -- Pane keywords on other table layers
  { key = "r",          mods = "LEADER",      action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
  { key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },

  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Renaming Tab Title...:" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    }
  },
}

wezterm.on("update-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  local stat_color = "#f7768e"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#7dcfff"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#bb9af7"
  end

  -- Current working directory
  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
  local cwd = pane:get_current_working_dir()
  cwd = cwd and basename(cwd) or ""
  -- Current command
  local cmd = pane:get_foreground_process_name()
  cmd = cmd and basename(cmd) or ""

  -- Time
  -- local time = wezterm.strftime("%H:%M")

  -- Left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = "  " },
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Text = " |" },
  }))

end)

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
  move_tab = {
    { key = "h",      action = act.MoveTabRelative(-1) },
    { key = "j",      action = act.MoveTabRelative(-1) },
    { key = "k",      action = act.MoveTabRelative(1) },
    { key = "l",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  }
}


config.window_decorations = 'RESIZE'
config.enable_scroll_bar = true
config.scrollback_lines = 30000

-- and finally, return the configuration to wezterm
return config
