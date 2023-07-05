Script to aggregate multiple different git repositories into one.
Specificly this script search for every repo on the repositories and transform this kind structure:
```
    ├── 5721
    │   ├── 35606 -repo
    │   │   └── doc
    │   ├── 35607 -repo
    │   │   └── doc
    │   └── 35609 -repo
    │       └── doc
    └── 8976
        └── 42512 -repo
```


into a repo named `page` of this nature:
```mermaid
---
title: structure of Git repo
---
%%{init: { 'logLevel': 'debug', 'theme': 'neutral' } }%%
gitGraph
   commit id:"init"
   branch "35606"
   commit
   commit
   commit
   checkout main
   branch "35607"
   commit
   commit
   checkout main
   branch "35609"
   commit
   commit
   commit
   commit
   checkout main
   branch "89706"
   commit
   commit
```

