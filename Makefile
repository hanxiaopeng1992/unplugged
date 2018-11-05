BOOK = unplugged
BOOK_EN = $(BOOK)-en
BOOK_CN = $(BOOK)-zh-cn
OBJ_EN = $(BOOK_EN).pdf
OBJ_CN = $(BOOK_CN).pdf
XELATEX = $(shell which xelatex > /dev/null)

ifdef XELATEX
LATEX = xelatex
DVIPDFM = echo
else
LATEX = latex
DVIPDFM = dvipdfmx
endif

SRC = common unplugged
SRC_EN = $(foreach file, $(SRC), $(file)-en.tex)
SRC_CN = $(foreach file, $(SRC), $(file)-zh-cn.tex)
CHAPTERS =
CHAPTER_OBJS = $(foreach file, $(CHAPTERS), $(file).pdf)
CHAPTER_SRCS = $(foreach file, $(CHAPTERS), $(file).tex)

all: cn en

cn: $(OBJ_CN)

en: $(OBJ_EN)

%.pdf : %.tex
	$(MAKE) -C $(@D) tex

image:
	$(MAKE) -C img

index:
	makeindex $(BOOK)

$(OBJ_CN): image $(SRC_CN) $(CHAPTER_OBJS)
	$(LATEX) $(BOOK_CN).tex
	makeindex $(BOOK_CN).idx
	$(LATEX) $(BOOK_CN).tex
	$(DVIPDFM) $(BOOK_CN)

$(OBJ_EN): image $(SRC_EN) $(CHAPTER_OBJS)
	$(LATEX) $(BOOK_EN).tex
	makeindex $(BOOK_EN).idx
	$(LATEX) $(BOOK_EN).tex
	$(DVIPDFM) $(BOOK_EN)

clean:
	rm -f *.aux *.toc *.lon *.lor *.lof *.ilg *.idx *.ind *.out *.log *.exa

distclean: clean
	rm -f *.pdf *.dvi *~
