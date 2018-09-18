# Open Bases Bioschema Template

This is an [openbases](https://openbases.github.io) builder
to generate a bioschemas specification using [map2model](https://www.github.com/vsoch/map2model)
to generate a specification for contribution to [bioschemas](https://www.github.com/openbases/specifications). You can use the container to generate your specification as follows:

 1. Fill in the templates provided on Google Drive, and download as tsv
 2. Run the [openbases/openbases-bioschema](https://hub.docker.com/r/openbases/builder-bioschema) container to generate your specification files
 3. Contribute your specification by way of a pull request to [bioschemas](https://www.github.com/openbases/specifications)

That's it! More information coming soon.

## Usage

### 1. Generate your Front Matter
Edit the file [configuration.yml](specifications/configuration.yml) in 
the [specifications](specifications) directory and fill in the values for your
specification. Are you editing or contributing more than one? Feel free to copy paste the chunk
(not including the "specifications" header) and have more than one.

### 2. Write your specification!
Now generate your new template! You can create a copy of the Google Drive template [provided here](https://docs.google.com/spreadsheets/d/1seHDwKRwET_H8maRTMmdXG7M1deh23Y613TaJ2Pd3qc/edit?usp=sharing).

### 3. Download to your Computer
When you are done, **export each sheet** as a tsv file (tab separated value) and drop into a subfolder named by your specification (e.g., "[DataCatalog](specifications/Datacatalog)" is a folder in [specifications](specifications). When you are done, you will have something like this:

```
specifications/
├── configuration.yml
└── DataCatalog
    ├── DataCatalog - Authors.tsv
    ├── DataCatalog - Bioschemas.tsv
    ├── DataCatalog - Mapping.tsv
    └── DataCatalog - Specification.tsv
```
(with optionally more than one specification subfolder!)

### 4. Generate the specification files
You now can generate your specification files with the provided Docker container! 

#### Ask for Help
If you need to ask for help, just run the container:

```bash
$ docker run openbases/builder-bioschema
Usage:


         docker run <container> [demo|start|help]
         docker run <container> demo
         docker run <container> help
         docker run -v /code/:/data <container> start

         Commands:

                help: show help and exit
                start:   generate a specification, with your subdirectory with the
                       specifications top level folder bound to /data
                demo: show a demo generation using files in the container
         
         Options [start]:

            --config CONFIG     configuration.yml file, defaults to configuration.yml in
                                folder
            --folder SPECS      folder with input specification subfolders
            --output OUTFOLDER  folder to write output specification subfolders
```

### See a demo
There are files provided in the container (the same demo ones in this folder)
that you can use (without mounting a volume) to see what output should look like:

```bash
$ docker run -it openbases/builder-bioschema demo
```

### See an Example
You can next try the local files provided in this repository to learn how to mount
the volume correctly. If you haven't already, clone the repository and go for it!

```bash
$ git clone https://www.github.com/openbases/builder-bioschema
$ cd builder-bioschema
```

Let's also going to set the output folders and input configuration file to
the ones we have locally, because it's likely you might have this setup. Importantly,
since we are binding the $PWD to the container, we need to reference paths in the
$PWD relative to /data in the container!

```
mkdir -p outfiles
$ docker run -it -v $PWD:/data openbases/builder-bioschema start --config /data/specifications/configuration.yml --output /data/outfiles
```

Here are your files!

```bash
$ tree outfiles/
outfiles/
└── DataCatalog
    ├── examples
    │   └── README.md
    ├── README.md
    └── specification.html
```

Now you know how to do your own!

### Contribute to bioschemas

When you have your finished folder, fork the bioschemas repository,
clone your fork, checkout a new branch, and add your folder
to the folder "specifications". Then issue a pull request!

```bash
git clone https://www.github.com/<username>/specifications
cd specifications
git checkout -b add/spec-datacatalog
```
add your folder, e.g. DataCatalog, to "specifications"

```bash
cp -R <generation_folder>/specifications/DataCatalog $PWD
git add DataCatalog
```

Then open a pull request to the [main repository](https://github.com/BioSchemas/specifications).

## Can we make this easier?

Yes! We will provide a continuous integration template (soon) for you to do this,
likely in the next few days.

## Development

Build the container

```bash
$ docker build -t openbases/builder-bioschemas .
```
