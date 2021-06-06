all: t5_octave.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .eps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), epstopdf $i;)

	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

t5_octave.log: t5.m
	octave t5.m > $@

clean:
	@rm -f *.log octave-workspace *.eps *.tex *.pdf *.ps *~ *.mat *.txt

.PHONY: clean
