.PHONY: page

AUTHOR = Kanai Hiroki

TIMESTAMP = $(shell date '+%Y%m%d')
TIMESTAMP2 = $(shell date '+%Y.%m.%d')
COMMON_HTMLS = header.html header.html

M4 = m4
M4FLAGS = -D TIMESTAMP=$(TIMESTAMP) -D AUTHOR='$(AUTHOR)'

index.html: index.html.m4 pages.html $(COMMON_HTMLS)
	@$(M4) $(M4FLAGS) -D TITLE='$(AUTHOR)' index.html.m4 > $@

page: template.html $(COMMON_HTMLS)
	@read -p "Enter page title[$(TIMESTAMP2)]: " title; \
	slug=`echo $$title | sed -E 's/[~^]+//g' | sed -E 's/[^a-zA-Z0-9]+/-/g' | sed -E 's/^-+|-+$$//g' | tr A-Z a-z`; \
	if [ -z "$$slug" ]; then slug=$(TIMESTAMP).html; title=$(TIMESTAMP2) anchor=$(TIMESTAMP2); else slug=$(TIMESTAMP)-$$slug.html; fi; \
	read -p "Enter file name [$$slug]: " file; \
	file=$${file:-$$slug}; \
	if [ -z "$$file" ]; then echo "invalid file name"; exit 1; fi; \
	$(M4) $(M4FLAGS) -D TITLE="$$title" template.html > $$file; \
	$$EDITOR $$file; \
	anchor=$${anchor:-$(TIMESTAMP2): $$title}; \
	echo '<li><a href="'$$file'">'$$anchor'</a></li>' >> pages.html

publish: index.html
	git add .
	git commit -m 'update'
	git push
