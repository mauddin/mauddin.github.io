# mauddin.github.io

Personal website of Majbah Uddin, built with [al-folio](https://github.com/alshedivat/al-folio) v1.2 (Jekyll) and deployed to GitHub Pages at <https://mauddin.github.io>.

## Local setup (macOS, one time)

```bash
brew install rbenv ruby-build imagemagick libyaml
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc && exec zsh
rbenv install 3.3.5          # version is pinned in .ruby-version (gitignored) / CI
gem install bundler
bundle install
```

Rust is not required. Node is used as the JavaScript runtime.

## Preview locally

```bash
bundle exec jekyll serve     # http://localhost:4000, rebuilds on save
```

## Where content lives

| Content | File |
| --- | --- |
| About page bio | `_pages/about.md` |
| Papers, reports, presentations | `_bibliography/papers.bib`, `reports.bib`, `presentations.bib` |
| PDFs linked from entries | `assets/pdf/` |
| CV page (web) | `_data/cv.yml` |
| CV PDF | `assets/pdf/UddinM_CV.pdf` (copy from `../publicCV/cv.pdf`) |
| Research projects | `_data/projects.yml` |
| Datasets, software, copyrights | `_data/software.yml` |
| Awards, certifications, media | `_data/awards.yml` |
| Service, affiliations, peer review | `_data/service.yml` |
| Social links and email | `_data/socials.yml` |
| Coauthor links (lowercase last name keys) | `_data/coauthors.yml` |
| Theme color and small style tweaks | `_sass/_custom.scss` |

Source of truth for content is the LaTeX CV in `../publicCV/cv/*.tex`.

## Common updates

**Add a paper.** Append a BibTeX entry to `_bibliography/papers.bib`. Useful fields:

- `doi={...}` shows a DOI button and a Dimensions citation badge (with `dimensions={true}`)
- `google_scholar_id={...}` shows a Google Scholar citation badge (ID is the part after `FRKGYKoAAAAJ:` in the paper's Scholar URL)
- `pdf={file.pdf}` links `assets/pdf/file.pdf`
- `selected={true}` lists the paper under "selected publications" on the About page
- `award_name={...}` and `award={...}` add an award button
- `abstract={...}` and `bibtex_show={true}` add Abstract and Bib buttons

**Add a PDF (author copy, report).** Copy the file into `assets/pdf/` (avoid spaces in the name) and add `pdf={that-file.pdf}` to the matching entry.

**Citation counts.** `.github/workflows/update-citations.yml` refreshes `_data/citations.yml` from Google Scholar on Mon/Wed/Fri and redeploys. Run it by hand from the Actions tab if needed.

## Deploy

Push to `master`. `.github/workflows/deploy.yml` builds the site and publishes it to the `gh-pages` branch. GitHub Pages must be set to serve from `gh-pages` (Settings > Pages).

## Updating the al-folio template

Theme code comes from pinned gems (`al_folio_core`, `al_folio_cv`, ...) in `Gemfile`. To update, bump the pinned versions to match a newer al-folio release, then:

```bash
bundle update
bundle exec al-folio upgrade audit
bundle exec al-folio upgrade overrides audit   # checks the local assets/css/main.scss override
bundle exec jekyll serve                        # review before pushing
```
