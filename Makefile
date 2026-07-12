HUGO ?= hugo
PORT ?= 1313

.DEFAULT_GOAL := help

help: ## Show available targets
	@grep -hE '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) \
		| awk -F':.*?## ' '{printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'

init: ## Fetch the theme submodule (run once after cloning)
	git submodule update --init --recursive

serve: init ## Live preview at http://localhost:$(PORT) (hot reload, shows drafts)
	$(HUGO) server -D --port $(PORT) --bind 0.0.0.0

build: init ## Production build into public/
	$(HUGO) --minify --gc

clean: ## Remove build output and caches
	rm -rf public resources .hugo_build.lock

check: build ## Build and fail on broken internal refs
	@echo "build ok: $$(find public -name '*.html' | wc -l) pages"

# --- content scaffolding -----------------------------------------------------
# Every content/<section>/ folder is discovered automatically by Hugo.
# Drop a .md file in one and it ships. These targets just save you the typing.

new-project: ## make new-project name=my-thing
	@test -n "$(name)" || { echo "usage: make new-project name=my-thing"; exit 1; }
	$(HUGO) new content/projects/$(name).md
	@echo "edit content/projects/$(name).md"

new-blog: ## make new-blog name=my-post
	@test -n "$(name)" || { echo "usage: make new-blog name=my-post"; exit 1; }
	$(HUGO) new content/blog/$(name).md
	@echo "edit content/blog/$(name).md"

new-news: ## make new-news name=my-update
	@test -n "$(name)" || { echo "usage: make new-news name=my-update"; exit 1; }
	$(HUGO) new content/news/$(name).md
	@echo "edit content/news/$(name).md"

new-section: ## make new-section name=skills  (new folder + nav entry, wired up)
	@test -n "$(name)" || { echo "usage: make new-section name=skills"; exit 1; }
	@test ! -d content/$(name) || { echo "content/$(name) already exists"; exit 1; }
	@mkdir -p content/$(name)
	@printf -- '---\ntitle: "%s"\nlayout: "list"\n---\n' "$$(echo $(name) | sed 's/.*/\u&/')" > content/$(name)/_index.md
	@W=$$(( $$(grep -c '^\[\[menu.main\]\]' hugo.toml) * 10 + 10 )); \
	printf '[[menu.main]]\n  identifier = "%s"\n  name = "%s"\n  url = "/%s/"\n  weight = %s\n' \
		"$(name)" "$$(echo $(name) | sed 's/.*/\u&/')" "$(name)" "$$W" >> hugo.toml
	@echo "created content/$(name)/ and added it to the nav. run: make serve"

.PHONY: help init serve build clean check new-project new-blog new-news new-section
