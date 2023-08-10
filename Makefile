FILES := \
  src/HsH-article.cls \
  src/HsH-report.cls \
  src/HsH-standalone.cls \
  src/config.tex

.PHONY: src
src: $(FILES)
$(FILES) &: HsH-Classes.ins HsH-Classes.dtx
	latex -output-directory=src HsH-Classes.ins

.PHONY: clean
clean:
	rm -f $(FILES)
