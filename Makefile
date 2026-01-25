files := LICENSE manifest.json icon.png worker.js

.PHONY: archive.zip
archive.zip: $(files)
	rm -f $@
	make manifest "browser=$(browser)"
	zip $@ $(files)

.PHONY: manifest
manifest:
	cue export manifest.cue -t "browser=$(browser)" > manifest.json
