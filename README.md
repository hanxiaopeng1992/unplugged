Mathematics of Programming - A gentle introduction

2018/11

This book introduces the mathematics behind computer programming. This is the **gentle** version for the people without mathematic or programming background. For the complete version, please refer to the [master branch](https://github.com/liuxinyu95/unplugged).

Contents
--------

We'll keep adding links for the chapters ready for preview.

- Chapter 1, Natural numbers. Peano Axiom, list and folding;
- Chapter 2, Recurrsion. Euclidean algorithm, Lambda calculus, and Y-combinator;
- Chapter 3, Group, Ring, and Field. Galois Theory;
- Chapter 4, Category theory and type system;
- Chapter 5, Deforest. Build-fold fusion law, optimization, and algorithm deduction;
- Chapter 6, Infinity. Set theory, Infinity and stream;
- Chapter 7, Logic paradox, Gödel's incompleteness theorems, and Turing halting problem.

Why a gentle version?
---------------------

When visited the art museum, I was impressed by a painting about an acient poet, [BAI Juyi](https://en.wikipedia.org/wiki/Bai_Juyi) (Tang Dynasity, 772 - 846). He was reading his new poem to two old ladies, then asked their feelings. With such efforts, his poem could be understood by all people, old and young, adults and children, male and female. It encouraged me to compose a new gentle version for the people who don't have much mathematic or programming background.

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
