# hivenal releases

Releases and the Homebrew formula for hivenal on macOS (Apple Silicon and Intel,
macOS 15 or newer). This repository holds no source code or development history.

## Install

No GitHub account or token is needed. Use Homebrew 7.0.6 or newer.

```sh
brew tap chalasz/hivenal https://github.com/chalasz/hivenal-releases.git
brew install chalasz/hivenal/hivenal
hivenal --version
```

## Update

```sh
hivenal update --published
hivenal --version
```

`brew upgrade` replaces only Homebrew's copy and does not select the new
version; use `hivenal update --published`.

Restart each office when ready, from its project directory, with `hivenal stop`
and then `hivenal start`.

## Uninstall

```sh
hivenal uninstall
brew uninstall hivenal
brew untap chalasz/hivenal
```

`hivenal uninstall` lists what it removes and asks first: the `hivenal` command
and its start helper in `~/.local/bin`, the installed releases and the
notifier. It refuses while an office runs; stop each office first. Office data
under `~/Library/Application Support/hivenal/offices` stays until you remove
it yourself.

## Moving from 0.1.0 or an older install

Version 0.1.0 and older installs do not update from this repository. Reinstall
once with these commands, in this order, without `--force`:

```sh
brew uninstall hivenal
brew untap chalasz/hivenal
brew tap chalasz/hivenal https://github.com/chalasz/hivenal-releases.git
brew install hivenal
"$(brew --prefix hivenal)/bin/hivenal" update --bundle "$(brew --prefix hivenal)/libexec"
hivenal --version
```

The `update --bundle` line selects the new version; without it `hivenal` keeps
running 0.1.0. `hivenal --version` should then no longer show `v0.1.0`. Restart
each office as described under Update.

## Support

https://github.com/chalasz

Issues are disabled in this repository.

## License

Free to install and use; copying, modifying or redistributing it is not
permitted. See [LICENSE](LICENSE).
