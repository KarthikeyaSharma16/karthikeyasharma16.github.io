# karthikeyasharma16.github.io

Personal site — [Hugo](https://gohugo.io) + [PaperMod](https://github.com/adityatelange/hugo-PaperMod), deployed to GitHub Pages by Actions on every push to `main`.

## Setup (once)

```bash
make init     # pulls the PaperMod theme submodule
```

Hugo extended ≥ 0.146 is required. Install: `sudo snap install hugo` or grab a
binary from https://github.com/gohugoio/hugo/releases.

## Everyday use

```bash
make serve    # live preview on http://localhost:1313, hot reload, shows drafts
make build    # production build into public/
make          # list all targets
```

## Adding content

Every folder under `content/` is a section, and Hugo discovers it automatically —
drop a markdown file in and it ships. No config edits.

```bash
make new-project name=my-accelerator   # -> content/projects/my-accelerator.md
make new-blog    name=hello-world      # -> content/blog/hello-world.md
make new-news    name=paper-accepted   # -> content/news/paper-accepted.md
make new-section name=skills           # -> content/skills/ + a nav entry
```

New pages start as `draft: true` — they show in `make serve` but are excluded
from the production build. Flip to `draft: false` to publish.

Images go in `static/img/` and are referenced as `/img/foo.png`.
PDFs go in `static/pdf/` → `/pdf/foo.pdf`.

To give a project a thumbnail on the list page:

```yaml
cover:
  image: "/img/my-thumbnail.png"
  alt: "My thumbnail"
  relative: false
```

## Deploying

Push to `main`. The workflow in `.github/workflows/deploy.yml` builds and
publishes. Repo **Settings → Pages → Source** must be set to **GitHub Actions**.
