Mathematics of Programming
====

2019/05

This book introduces the mathematics behind computer programming.

[<img src="https://user-images.githubusercontent.com/332938/57565325-90303580-73ee-11e9-8d74-b78b079dbb64.png" width="210">](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180330/unplugged-zh-cn.pdf)

Contents
--------

The book can be previewed in ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180330/unplugged-zh-cn.pdf)).

- Chapter 1, Natural numbers. Peano Axiom, list and folding; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180/nat-zh-cn.pdf), [EN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180/nat-en.pdf))
- Chapter 2, Recurrsion. Euclidean algorithm, Lambda calculus, and Y-combinator; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180331/recursion-zh-cn.pdf), [EN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180331/recursion-en.pdf))
- Chapter 3, Group, Ring, and Field. Galois Theory; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.61802/algebra-zh-cn.pdf))
- Chapter 4, Category theory and type system; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.61803/category-zh-cn.pdf))
- Chapter 5, Deforest. Build-fold fusion law, optimization, and algorithm deduction; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.618030/deduction-zh-cn.pdf))
- Chapter 6, Infinity. Set theory, Infinity and stream; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.618031/infinity-zh-cn.pdf))
- Chapter 7, Logic paradox, Gödel's incompleteness theorems, and Turing halting problem. ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.618032/paradox-zh-cn.pdf))

Install
--------

To build the book in PDF format from the sources, you need
the following software pre-installed.

- TeXLive, The book is built with XeLaTeX, a Unicode friendly version of TeX;
- ImageMagick, which converts the images to eps format;

### Install TeXLive

In Debian/Ubuntu like Linux environment, do **NOT** install the TeXLive through apt-get. Go to TeXLive [official site](https://tug.org/texlive/) to download the setup script.

```bash
$ wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl.zip
$ unzip install-tl.zip
$ cd install-tl
$ sudo ./install-tl -gui text -repository http://mirror.ctan.org/systems/texlive/tlnet
```

In Windows, TeXLive provide a [gui based installer](https://tug.org/texlive/), in Mac OS X, there's a [MacTeX](https://www.tug.org/mactex/).


### Install ImageMagick

```bash
$ sudo apt-get install imagemagick
```

For Windows and Mac OS X installer, it can be download through http://www.imagemagick.org

### Cusotmize font (Optional)

If the host system fonts are available, e.g. under VM. they
could be imported as the following example:

```bash
$ sudo mkdir /usr/share/fonts/host-system
$ sudo cp /Host-System/Fonts/{FontName, fontname}* /usr/share/fonts/host-system/
$ fc-cache
```

### Others

You need the GNU make tool, in Debian/Ubuntu like Linux, it can be installed through the apt-get command:

```bash
$ sudo apt-get install build-essential
```

In Windows, you can install the MSYS for it. In Mac OS X, please install the developer tool from this command line:

```bash
$ xcode-select --install
```

### Build the book PDF

enter the folder contains the book TeX manuscript, run

```bash
$ make
```

This will generate unplugged-en.pdf and unplugged-zh-cn.pdf. If you only need the Chinese version for example, you can run `make cn` instead.

--

LIU Xinyu

liuxinyu95@gmail.com

``Cogito ergo sum''
