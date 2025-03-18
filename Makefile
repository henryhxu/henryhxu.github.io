DOCS=index papers students artifacts teaching services bio dcn join 5296 5570

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix ./, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)


./%.html : %.jemdoc MENU
	# jemdoc -c mysite.conf *.jemdoc
	# ./jemdoc.py -c mysite.conf -o $@ $<
	./jemdoc -c mysite.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f ./*.html
