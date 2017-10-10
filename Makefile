DOCS=index papers students downloads teaching services bio dcn join

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix ./, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

# .PHONY : update
# update : $(PHDOCS)
	# @echo -n 'Copying to server...'
	# @scp -oHostKeyAlgorithms=+ssh-dss *.js *.html *.css *.jpg *.gif *.png MENU hxu@gateway.cs.cityu.edu.hk:./www/
	# @echo ' done.'

./%.html : %.jemdoc MENU
	# ./jemdoc -c mysite.conf *.jemdoc
	./jemdoc.py -c mysite.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f ./*.html
