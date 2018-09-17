# Open Bases Bioschema Template

This is an [openbases](https://openbases.github.io) builder
to generate a bioschemas specification using [map2model](https://www.github.com/vsoch/map2model)
to generate a specification for contribution to [bioschemas](https://www.github.com/openbases/specifications). You can use the container to generate your specification as follows:

 1. Fill in the templates provided on Google Drive, and download as tsv
 2. Run the [openbases/openbases-bioschema]() container to generate your specification files
 3. Contribute your specification by way of a pull request to [bioschemas](https://www.github.com/openbases/specifications)

That's it! More information coming soon.

## Development

Build the container

```bash
$ docker build -t openbases/builder-bioschemas .
```
