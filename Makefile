DOCS=index projects papers students downloads teaching services bio dcn

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix ./, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(PHDOCS)
	@echo -n 'Copying to server...'
	@scp *.html *.css MENU hxu@gateway.cs.cityu.edu.hk:./www/
	@echo ' done.'

.PHONY : papers
papers : $(PHDOCS)
	@echo -n 'Copying to server...'
	@scp share/*.* hxu@gateway.cs.cityu.edu.hk:./www/share/
	@echo ' done.'

./%.html : %.jemdoc MENU
	jemdoc -c mysite.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f ./*.html
