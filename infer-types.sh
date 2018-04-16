#!/bin/sh

export CORETYPEDVERSION=${1:-"0.5.1-SNAPSHOT"}

cp profiles.clj clojurescript/
echo "Using core.typed version $CORETYPEDVERSION"
cd clojurescript/
git checkout master -f
lein with-profiles rti typed infer-type cljs.compiler :test-timeout-ms 200 :test-selectors [cljs.compiler-tests] :infer-opts "{:out-dir \"../clojurescript/infer-type\"}"
