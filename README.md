# Azure Bicep demo
Bicep presentation and demo for the "Arrancando curso 2021-2022 con fuerza: Bicep!" talk.

# Presentation

The slides are made with [Marp](https://marp.app/), written in Markdown and with some customisations in HTML.
The raw source for the slides are available in the `slides` folder.

The presentation is published with [a GitHub action](https://github.com/piraces/bicep-demo/actions/workflows/slides.yml), generating the presentation in different formats (PDF and PPTX) and publishing them as artifacts. The action also publish it as a interactive website in GitHub Pages [here](https://piraces.github.io/bicep-demo/).

# Demo

All resources used in the demo are available in this repository.

## ARM Templates

The ARM templates used in this demo are available in the folder `arm_templates` (each example in a subdirectory with a `reference.md` file to help to manage it).

The main goal of these templates is to show the process of migrating to Bicep.

## Bicep files

The `.bicep` files used in this demo are available in the folder `bicep_files` (each example in a subdirectory with a `reference.md` file to help to manage it).

The main goal of these files is to show the main funcionallity of Bicep and perform a test deployment to show all the process to deploy to Azure.