# Meow
A minimalistic `lolcat` clone for Windows that actually works.

# What?
No `lolcat` clone would be complete without this picture, right? So here it is.

> ![](http://i3.photobucket.com/albums/y83/SpaceGirl3900/LOLCat-Rainbow.jpg)

## Screenshot

![](https://github.com/kiedtl/meow/raw/master/img/screenshot.gif)

## Usage
Because Meow is meant to be a minimalistic clone, and due to the limitations of the Windows Console (`conhost.exe`), Meow has very little functionality compared to `lolcat` itself.

**OPTIONS**

| Alias | Option  | Description                                    |
|-------|---------|------------------------------------------------|
| -f    | -File   | The file to read from or the text to display.  |
| -s,   | -Spread | The color spread for the color rainbow.        |
| -h,   | -Help   | Display the help message.                      |
| -d,   | -Demo   | Show a demonstration of `meow`.                |

## Installation

Just download the `source.zip` file from the releases (latest is v0.1.2) and add `meow.ps1` to your `$PATH`.

You can also painlessly install Meow with [Scoop](https://scoop.sh).

First, though, add the [Open-Scoop](https://github.com/kiedtl/open-scoop) bucket if you haven't already. (To see if you have, just run `scoop bucket list`.)
```powershell
$ scoop bucket add https://github.com/kiedtl/open-scoop open-scoop
```
Then install Meow:
```powershell
$ scoop install meow
```

## License
- AGPL-v3.0


