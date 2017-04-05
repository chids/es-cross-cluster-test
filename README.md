[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

This is a hack.

Requires Elasticsearch 5.3, has only been tested with `brew install elasticsearch` on OS X.

1. `start.sh`
2. `curl -v -XPOST http://127.0.0.1:9310/data/foo -H"Content-Type: application/json" -d'{"value": "foo"}'`
3. `curl -v -XPOST http://127.0.0.1:9320/data/foo -H"Content-Type: application/json" -d'{"value": "bar"}'`
4. `http://127.0.0.1:9340/local:data,remote:data/_search`
5. Profit...ish.
