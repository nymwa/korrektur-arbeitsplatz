#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget -qnc http://data.statmt.org/news-crawl/de/news.2007.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2008.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2009.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2010.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2011.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2012.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2013.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2014.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2015.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2016.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2017.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2018.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2019.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-crawl/de/news.2020.de.shuffled.deduped.gz &
wget -qnc http://data.statmt.org/news-commentary/v16/training-monolingual/news-commentary-v16.de.gz &
wget -qnc http://www.statmt.org/europarl/v10/training-monolingual/europarl-v10.de.tsv.gz &
wait

