FILES := \
  HsH-article.cls \
  HsH-report.cls \
  HsH-standalone.cls \
  config.tex

.PHONY: src
src: $(FILES)
$(FILES) &: HsH-Classes.ins HsH-Classes.dtx
	latex HsH-Classes.ins

.PHONY: clean
clean:
	rm -f $(FILES)
