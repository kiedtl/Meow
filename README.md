# Meow
A minimalistic `lolcat` clone for Windows that actually works.

## What?
No `lolcat` clone would be complete without this picture, right? So here it is.

> ![](http://i3.photobucket.com/albums/y83/SpaceGirl3900/LOLCat-Rainbow.jpg)

## Screenshot
#### Current Screenshot (v0.2019.01.31)
![](https://github.com/kiedtl/meow/raw/master/img/screenshot-new.gif)

#### Old screenshot (v0.2019.01.15)
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

If you have Git installed, clone the repository into whatever directory you want and add the `bin\meow.ps1` file to your PATH. And if you don't, install it and come back later.

You can also painlessly install Meow with [Scoop](https://scoop.sh).
First, ensure that you have the `extras` bucket added:
```powershell
$ scoop bucket list
nirsoft
java
blah blah
...

extras
```

If you don't, add it.
```
$ scoop bucket add extras
```

Then install Meow:
```powershell
$ scoop install meow
```

Updating to the latest version is also easy:
```powershell
$ scoop update meow 
```

## License
I'm a cranky dev, and i'm not too fond of people freely using my stuff that I worked hard on, so I've licensed my work under the following license:
- AGPL-v3.0


