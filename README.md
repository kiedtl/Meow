# Meow
A minimalistic `lolcat` clone for Windows that actually works.

## What?
No `lolcat` clone would be complete without this picture, right? So here it is.

> ![](http://i3.photobucket.com/albums/y83/SpaceGirl3900/LOLCat-Rainbow.jpg)

## Screenshot
#### Current Screenshot (v0.2019.01.31)
![](https://github.com/kiedtl/meow/raw/master/img/screenshot-new.gif)

#### Old screenshot (v0.2.0)
![](https://github.com/kiedtl/meow/raw/master/img/screenshot.gif)

## Usage
Because Meow is meant to be a minimalistic clone, and due to the limitations of the Windows Console (`conhost.exe`), Meow has very little functionality compared to `lolcat` itself.

**OPTIONS**

| Alias | Option         | Description                                     |
|-------|----------------|-------------------------------------------------|
|  -f   |  -File         |  The file to read from or the text to display.  |
|  -s   |  -Spread       |  The color spread for the color rainbow.        |
|  -q   |  -Frequency    |  The frequency of the color spread.             |
|  -i   |  -Invert       |  Invert the foreground and background colors.   |
|  -h   |  -Help         |  Display the help message.                      |
|  -d   |  -Demo         |  Show a demonstration of `meow`.                |
  

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
I'm a cranky dev, and i'm not too fond of people freely using my stuff that I worked hard on, so I've licensed my work under the following license:
- AGPL-v3.0


