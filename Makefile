DOC=tmux-cheat

install : ${DOC}.7
	mkdir -p /usr/local/man/man7
	cp ${DOC}.7 /usr/local/man/man7/
	chmod 644 /usr/local/man/man7/${DOC}.7

uninstall : 
	rm -f /usr/local/man/man7/${DOC}.7

all : install pdf 

pdf : ${DOC}.pdf

${DOC}.pdf : ${DOC}.ps
	ps2pdf ${DOC}.ps

${DOC}.ps : ${DOC}.7
	groff -man -P-pletter ${DOC}.7 >${DOC}.ps

clean :
	rm -r ${DOC}.ps

clean-all :
	rm -rf ${DOC}.pdf ${DOC}.ps

.PHONY : install uninstall all pdf clean clean-all
