.PHONY: all clean validate optimize fit-ratio frame-objects png metadata catalog webp css fetch-objects fetch-galaxies

all: clean validate optimize fit-ratio frame-objects metadata catalog attribution png webp css

clean:
	@rm -rf exports
	@echo "Cleaned."

# Import per-object icons from the misp-objects submodule into src/svg/objects,
# then run `make all` to build assets. Pass REFRESH=1 to first pull the latest
# of the tracked submodule branch.
fetch-objects:
	@bash src/scripts/fetch-object-icons.sh

fetch-galaxies:
	@bash src/scripts/fetch-galaxy-icons.sh

validate:
	@bash src/scripts/validate-icons.sh
	@bash src/scripts/validate-metadata.sh

optimize:
	@bash src/scripts/optimize-svgs.sh

fit-ratio:
	@bash src/scripts/fit-to-ratio.sh

# Add the object container marker (thin rounded frame) to src/svg/objects.
# Runs after fit-ratio so it frames the already content-cropped glyphs.
frame-objects:
	@bash src/scripts/frame-objects.sh

catalog:
	@bash src/scripts/generate-catalog.sh

attribution:
	@bash src/scripts/generate-attribution.sh

assets: webp png

webp:
	@bash src/scripts/generate-webp.sh

png:
	@bash src/scripts/generate-pngs.sh

css:
	@bash src/scripts/generate-css.sh