all: latex evince clean

LATEX=latex
DVIPDF=dvipdf
BIBTEX=bibtex

latex:
	$(LATEX) ufpa_tcc_template
	$(BIBTEX) ufpa_tcc_template
	$(LATEX) ufpa_tcc_template
	$(LATEX) ufpa_tcc_template
	$(DVIPDF) ufpa_tcc_template
		
evince:	
	evince ufpa_tcc_template.pdf &	
	
clean: 
	rm -rf ufpa_tcc_template.aux ufpa_tcc_template.bbl ufpa_tcc_template.blg ufpa_tcc_template.log ufpa_tcc_template.lot ufpa_tcc_template.lof ufpa_tcc_template.toc 

