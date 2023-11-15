all: dist/metamorphosis.html dist/metamorphosis.pdf

dist/metamorphosis.pdf: src/metamorphosis.md .venv templates/manuscript.html
	mkdir -p dist
	. .venv/bin/activate; pandoc $< -o $@ --pdf-engine weasyprint --template templates/manuscript.html

dist/metamorphosis.html: src/metamorphosis.md .venv templates/manuscript.html
	mkdir -p dist
	. .venv/bin/activate; pandoc $< -o $@ --template templates/manuscript.html

.venv: requirements.txt
	python3 -m venv .venv
	. .venv/bin/activate; python -m pip install -r requirements.txt
