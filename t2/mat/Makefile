all: t2_1_octave.log t2_2_octave.log t2_3_octave.log t2_4_octave.log t2_5_octave.log t2_6_octave.log
	$(eval NGSFIGS=$(shell grep _FIG t2_3_octave.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .eps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), epstopdf $i;)
	$(eval NGSFIGS=$(shell grep _FIG t2_5_octave.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .eps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), epstopdf $i;)
	$(eval NGSFIGS=$(shell grep _FIG t2_6_octave.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .eps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), epstopdf $i;)
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(eval NGSTABS=$(shell grep _TAB t2_2_octave.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_2_octave.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(eval NGSTABS=$(shell grep _TAB t2_3_octave.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_3_octave.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(eval NGSTABS=$(shell grep _TAB t2_4_octave.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_4_octave.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(eval NGSTABS=$(shell grep _TAB t2_5_octave.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_5_octave.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(eval NGSTABS=$(shell grep _TAB t2_6_octave.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_6_octave.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

t2_1_octave.log:
	octave t2_1.m > $@

t2_2_octave.log:
	octave t2_2.m > $@

t2_3_octave.log:
	octave t2_3.m > $@

t2_4_octave.log:
	octave t2_4.m > $@

t2_5_octave.log:
	octave t2_5.m > $@

t2_6_octave.log:
	octave t2_6.m > $@

clean:
	@rm -f *.log octave-workspace *.eps *.tex *.pdf *.ps *~ *.mat *.txt

.PHONY: clean
