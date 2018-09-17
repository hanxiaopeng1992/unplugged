Mathematics of Programming
====

2018/07

This book introduces the mathematics behind computer programming.

Contents
--------

We'll keep adding links for the chapters ready for preview.

- Chapter 1, Natural numbers. Peano Axiom, list and folding; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180/nat-zh-cn.pdf), [EN](https://github.com/liuxinyu95/unplugged/releases/download/v0.6180/nat-en.pdf))
- Chapter 2, Recurrsion. Euclidean algorithm, Lambda calculus, and Y-combinator; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.61801/recursion-zh-cn.pdf))
- Chapter 3, Group, Ring, and Field. Galois Theory; ([CN](https://github.com/liuxinyu95/unplugged/releases/download/v0.61802/algebra-zh-cn.pdf))
- Chapter 4, Category theory. Category, arrow, and functors. Type system;
- Chapter 5, Deforest. Build-fold fusion law, optimazation, and algorithm deduction;
- Chapter 6, Infinity. Set theory, Infinity and stream;
- Chapter 7, Logic paradox, Gödel's incompleteness theorems, and Turing halting problem.

Install
--------

To build the book in PDF format from the sources, you need
the following software pre-installed.

- TeXLive, The book is built with XeLaTeX, a Unicode friendly version of TeX;
- ImageMagick, which can convert the images files to eps format;

Install TeXLive

In Debian/Ubuntu like Linux environment, do **NOT** install the TeXLive through apt-get. Go to TeXLive official site to download the setup scrpt.

```bash
$ wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl.zip
$ unzip install-tl.zip
$ cd install-tl
$ sudo ./install-tl -gui text -repository http://mirror.ctan.org/systems/texlive/tlnet
```

In Windows, TeXLive provide a gui based installer, in Mac OS X, there's a MacTeX, please visit TeXLive for detail:
https://tug.org/texlive/

Install ImageMagick

```bash
$ sudo apt-get install imagemagick
```

For Windows and Mac OS X installer, it can be download through http://www.imagemagick.org

Cusotmize font (Optional)

If the host system fonts are available, e.g. under VM. they
could be imported as the following example:

```bash
$ sudo mkdir /usr/share/fonts/host-system
$ sudo cp /Host-System/Fonts/{FontName, fontname}* /usr/share/fonts/host-system/
$ fc-cache
```

Others

You need the GNU make tool, in Debian/Ubuntu like Linux, it can be installed through the apt-get command:

```bash
$ sudo apt-get install build-essential
```

In Windows, you can install the MSYS for it. In Mac OS X, please install the developer tool from this command line:

```bash
$ xcode-select --install
```

Build the book PDF

enter the folder contains the book TeX manuscript, run

```bash
$ make
```

This will generate unplugged-en.pdf.

--

LIU Xinyu

liuxinyu95@gmail.com

``Cogito ergo sum''
