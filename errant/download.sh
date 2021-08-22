#!/bin/bash

git clone https://github.com/adrianeboyd/errant.git -b wnut2018

mkdir errant/resources/tree-tagger-3.2
cd errant/resources/tree-tagger-3.2
wget https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tree-tagger-linux-3.2.4.tar.gz
tar zxf tree-tagger-linux-3.2.4.tar.gz
mkdir lib
cd lib
wget https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/german.par.gz
gunzip -k german.par.gz
mv german.par german-utf8.par

