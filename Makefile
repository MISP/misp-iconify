.PHONY: all clean validate optimize png metadata catalog webp

all: clean validate optimize metadata catalog attribution png webp

clean:
	@rm -rf exports
	@echo "Cleaned."

validate:
	@bash src/scripts/validate-icons.sh
	@bash src/scripts/validate-metadata.sh

optimize:
	@bash src/scripts/optimize-svgs.sh

catalog:
	@bash src/scripts/generate-catalog.sh

attribution:
	@bash src/scripts/generate-attribution.sh

webp:
	@bash src/scripts/generate-webp.sh

png:
	@bash src/scripts/generate-pngs.sh
