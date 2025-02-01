TIMESTAMP = $(shell date '+%Y%m%d')

blog.html: template.html
	echo $(TIMESTAMP)
	sed "s/%created%/$(TIMESTAMP)/" < $<

index.html:

publish:
	git add .
	git commit -m 'update'
	git push
