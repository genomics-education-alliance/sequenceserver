# Sequence Server v1.0.11

This is a Docker image for latest stable version of [Sequence Server](http://www.sequenceserver.com/).

It has some enhancements such as caching of the blast results.
This is done by adding [wrappers](https://github.com/cghiban/blast-wrapper) for caching the output. 
These wrappers are added to `/usr/local/bin`

To start a docker instance:
```
$ mdir -p tmp
$ docker run --rm -itp 4567:4567 \
    -v /path/to/your/blast-database:/db \
    -v tmp:/tmp \
    sequenceserver -D --bin /usr/local/bin/
```


