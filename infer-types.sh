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
  cd $1
  git checkout master -f

  lein with-profiles dev,rti typed infer-type $2 :test-timeout-ms $3 :test-selectors $4 :infer-opts "{:out-dir \"../out/types/$1\"}"
  lein with-profiles dev,rti typed infer-spec $2 :test-timeout-ms $3 :test-selectors $4 :infer-opts "{:out-dir \"../out/specs/$1\"}"
}

cp profiles.clj clojurescript/
echo "Using core.typed version $CORETYPEDVERSION"

#infer clojurescript cljs.compiler 200 "[cljs.compiler-tests]" https://github.com/clojure/clojurescript.git
infer clj-time clj-time.core 200 "[]" https://github.com/clj-time/clj-time.git
