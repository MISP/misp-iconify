.PHONY: all clean validate optimize png metadata catalog webp

all: clean validate optimize png metadata catalog webp

clean:
	@rm -rf exports
	@rm -f metadata/icons.json
	@echo "Cleaned."

validate:
	@bash scripts/validate-icons.sh

optimize:
	@bash scripts/optimize-svgs.sh

png:
	@bash scripts/generate-pngs.sh

metadata:
	@bash scripts/generate-metadata.sh

catalog:
	@bash scripts/generate-catalog.sh

webp:
	@bash scripts/generate-webp.sh
