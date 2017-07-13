TEX = xelatex
EXAMPLES_DIR = examples
OUTDIR?=$(EXAMPLES_DIR)
INDIR?=$(EXAMPLES_DIR)
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

ifdef 0
examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(TEX) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(TEX) -output-directory=$(EXAMPLES_DIR) $<

endif
$(coverletter).pdf: $(INDIR)/$(coverletter).tex
	$(TEX) -output-directory=$(OUTDIR) $<
	$(TEX) -output-directory=$(OUTDIR) $<

clean:
	rm -f *~ *.synctex.gz *.aux *.log *.out *.backup *.toc *.temp *.pdf
