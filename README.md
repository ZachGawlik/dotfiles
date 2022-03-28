My personal dotfiles.

On a new computer, run `./install/new-computer-install.sh`

If this piqued your interests, I encourage you to read [my post][my-post] on setting up a new macOS dev machine as well as [Github's page on dotfiles][gh-dotfiles].

[gh-dotfiles]: https://dotfiles.github.io/
[my-atom-settings]: https://gist.github.com/ZachGawlik/ecf6232be9207b9a5f21478df297d80e
[my-post]: https://zachgawlik.com/blog/macos-dev-machine/
[sync-settings-repo]: https://github.com/atom-community/sync-settings


## Gotchas

Make sure iterm is set as a login shell. This is necessary so that `.zprofile` is ran

The symlinks expect this repo to live in `~/dev/dotfiles`. If that's not the case, then update