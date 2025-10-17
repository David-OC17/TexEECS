# TexEECS

## Usage

1. Install [VScode](https://code.visualstudio.com/download)

2. Install the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop&ssr=false#review-details) extension for VSCode

3. Clone the repository
```bash
  $ cd /home/<...>/
  $ git clone git@github.com:David-OC17/TexEECS.git
```

4. Configure `.vscode/settings.json` to provide `TEXTINPUTS` and make the templates discoverable.

With a `.vscode/settings.json` file like the following, replace `<...>` in `TEXTINPUTS` with the corresponding path to your TexECCS clone.

```JSON
  {
    "latex-workshop.latex.tools": [
      {
        "name": "pdflatex with TEXINPUTS",
        "command": "pdflatex",
        "args": [
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ],
        "env": {
          "TEXINPUTS": "/home/<...>/TexEECS/template//:/home/<...>/TexEECS/include//:/home/<...>/TexEECS/common//:"
        }
      }
    ],
    "latex-workshop.latex.recipes": [
      {
        "name": "pdflatex with TEXINPUTS",
        "tools": [
          "pdflatex with TEXINPUTS"
        ]
      }
    ]
  }
```