all: t2_1_ngspice.log t2_2_ngspice.log t2_3_ngspice.log t2_4_ngspice.log t2_5_ngspice.log
#These lines aren't needed, because we don't have figures.
	$(eval NGSFIGS=$(shell grep _FIG t2_3_ngspice.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf -dEPSCrop $i;)
	$(eval NGSFIGS=$(shell grep _FIG t2_4_ngspice.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf -dEPSCrop $i;)
	$(eval NGSFIGS=$(shell grep _FIG t2_5_ngspice.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf -dEPSCrop $i;)
#	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
#	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
#	$(eval NGSTABS=$(shell grep _TXT_V_68 $< | sed 's/_TXT_V_68//g' | sed ':a;N;$!ba;s/\n/ /g'))
#	$(foreach i, $(NGSTABS), sed -n '/^$i_TXT_V_68/,/^$i_END_V_68/{p;/^$i_END_V_68/q}' $< | grep -v $i_TXT_V_68 | grep -v $i_END_V_68 | grep -v '#' | sed '' > $i.txt;)
#	python2 -u forData.py
	$(eval NGSTABS=$(shell grep _TAB t2_2_ngspice.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_2_ngspice.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

t2_1_ngspice.log: ../sim/t2_1.net
	ngspice -b $< -o $@

t2_2_ngspice.log: ../sim/t2_2.net
	$(eval NGSTABS=$(shell grep _TAB t2_1_ngspice.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' t2_1_ngspice.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)
	$(eval NGSTABS=$(shell grep _TXT_V_68 t2_1_ngspice.log | sed 's/_TXT_V_68//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TXT_V_68/,/^$i_END_V_68/{p;/^$i_END_V_68/q}' t2_1_ngspice.log | grep -v $i_TXT_V_68 | grep -v $i_END_V_68 | grep -v '#' | sed '' > $i.txt;)
	python2 -u forData.py
	ngspice -b $< -o $@

t2_3_ngspice.log: ../sim/t2_3.net
	ngspice -b $< -o $@

t2_4_ngspice.log: ../sim/t2_4.net
	ngspice -b $< -o $@

t2_5_ngspice.log: ../sim/t2_5.net
	ngspice -b $< -o $@

clean:
	@rm -f *.log *.tex *.pdf *.ps *~ *.txt

.PHONY: t2_1_ngspice.log t2_2_ngspice.log t2_3_ngspice.log t2_4_ngspice.log t2_5_ngspice.log all clean
