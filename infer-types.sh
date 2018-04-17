#!/bin/bash

export CORETYPEDVERSION=${1:-"0.5.1-SNAPSHOT"}

# $1 = local name of the repository
# $2 = namespace to infer
# $3 = ms timeout
# $4 = selectors
# $5 = clone URL
function infer {
  if [ ! -d "$1" ]
    then
      git clone $5 $1
  fi
  cp profiles.clj $1/
  cd $1
  #git checkout master -f


  lein with-profiles dev,rti typed infer-type $2 :test-timeout-ms $3 :test-selectors $4 :infer-opts "{:out-dir \"../out/types/$1\"}"
  lein with-profiles dev,rti typed infer-spec $2 :test-timeout-ms $3 :test-selectors $4 :infer-opts "{:out-dir \"../out/specs/$1\"}"
  cd ..
}

echo "Using core.typed version $CORETYPEDVERSION"

infer clj-time clj-time.core 200 "[]" https://github.com/clj-time/clj-time.git
infer compojure compojure.core 3000 "[]" https://github.com/weavejester/compojure.git
infer fs me.raynes.fs 3000 "[]" https://github.com/Raynes/fs.git
infer startrek-clojure startrek.core 3000 "[]" https://github.com/marcusm/startrek-clojure.git
infer data.xml clojure.data.xml 3000 "[]" https://github.com/clojure/data.xml.git
infer math.combinatorics clojure.math.combinatorics 3000 "[]" https://github.com/clojure/math.combinatorics.git
infer java.jdbc clojure.java.jdbc 200 "[]" https://github.com/clojure/java.jdbc.git
infer data.priority-map clojure.data.priority-map 3000 "[]" https://github.com/clojure/data.priority-map.git
infer data.json clojure.data.json 3000 "[]" https://github.com/clojure/data.json.git
infer data.int-map clojure.data.int-map 3000 "[]" https://github.com/clojure/data.int-map.git

#infer clojurescript cljs.compiler 200 "[cljs.compiler-tests]" https://github.com/clojure/clojurescript.git
##infer tools.analyzer.jvm clojure.tools.analyzer.jvm 1000 "[]" https://github.com/clojure/tools.analyzer.jvm.git
