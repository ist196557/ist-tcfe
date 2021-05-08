all: t3_octave.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .eps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), epstopdf $i;)

t3_octave.log: t3.m
	octave t3.m > $@

clean:
	@rm -f *.log octave-workspace *.eps *.tex *.pdf *.ps *~ *.mat *.txt

.PHONY: clean
