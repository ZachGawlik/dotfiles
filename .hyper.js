// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: 'stable',

    fontSize: 16,
    fontFamily: '"Inconsolata for Powerline", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    cursorShape: 'BLOCK',
    cursorBlink: true,

    // custom css to embed in the main window
    css: '',
    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // An object of environment variables to set before launching shell
    env: {},

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    quickEdit: true,

    // The number of rows to be persisted in terminal buffer for scrolling
    scrollback: 50000,

    // hyperborder config
    // TODO: Want to customize this to assign different border colors for nth
    // window. built-in 'random' almost works, but its blur is also randomized
    hyperBorder: {
      borderColors: ['#1D976C', '93F9B9'],
      blurredColors: ['#177C59', '84E0A6'],
    },

    // hyper-pane config
    paneNavigation: {
      debug: false,
      hotkeys: {
        navigation: {
          up: 'ctrl+alt+up',
          down: 'ctrl+alt+down',
          left: 'ctrl+alt+left',
          right: 'ctrl+alt+right'
        },
        jump_prefix: 'ctrl+alt', // completed with 1-9 digits
        permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
        maximize: 'meta+enter'
      },
      showIndicators: false, // Show pane number
      indicatorPrefix: '^⌥', // Will be completed with pane number
      indicatorStyle: { // Added to indicator <div>
        position: 'absolute',
        top: 0,
        left: 0,
        fontSize: '10px'
      },
      focusOnMouseHover: false,
      inactivePaneOpacity: 0.6 // Set to 1 to disable inactive panes dimming
    },

    // hyperterm-tabs
    hyperTabsMove: {
      moveLeft: 'command+[',
      moveRight: 'command+]'
    },

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyper-night-owl",
    "hyperborder",
    "hyper-search",
    "hyper-statusline",
    "hypercwd",
    "hyper-tab-icons",
    "hyperterm-tabs",
    "hyperterm-dibdabs",
    // TODO: fork this, causes index lock issues on larger repos
    // https://github.com/henrikdahl/hyper-statusline/pull/94
    // "hyper-statusline",
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o'
  }
};
