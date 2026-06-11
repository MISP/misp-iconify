.PHONY: all clean validate optimize fit-ratio png metadata catalog webp css

all: clean validate optimize fit-ratio metadata catalog attribution png webp css

clean:
	@rm -rf exports
	@echo "Cleaned."

validate:
	@bash src/scripts/validate-icons.sh
	@bash src/scripts/validate-metadata.sh

optimize:
	@bash src/scripts/optimize-svgs.sh

fit-ratio:
	@bash src/scripts/fit-to-ratio.sh

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