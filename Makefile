BOOK = unplugged-zh-cn
XELATEX = $(shell which xelatex > /dev/null)

ifdef XELATEX
LATEX = xelatex
DVIPDFM = echo
else
LATEX = latex
DVIPDFM = dvipdfmx
endif

SRC = common-zh-cn.tex unplugged-zh-cn.tex
CHAPTERS =
CHAPTER_OBJS = $(foreach file, $(CHAPTERS), $(file).pdf)
CHAPTER_SRCS = $(foreach file, $(CHAPTERS), $(file).tex)

all: $(BOOK).pdf

%.pdf : %.tex
	$(MAKE) -C $(@D) tex

image:
	$(MAKE) -C img

index:
	makeindex $(BOOK)

$(BOOK).pdf: image $(SRC) $(CHAPTER_OBJS)
	$(LATEX) $(BOOK).tex
	makeindex $(BOOK).idx
	$(LATEX) $(BOOK).tex
	$(DVIPDFM) $(BOOK)

clean:
	rm -f *.aux *.toc *.lon *.lor *.lof *.ilg *.idx *.ind *.out *.log *.exa

distclean: clean
	rm -f *.pdf *.dvi *~
