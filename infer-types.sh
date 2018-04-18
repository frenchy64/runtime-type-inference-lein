#!/bin/bash

export CORETYPEDVERSION=${1:-"0.5.1-SNAPSHOT"}

# $1 = local name of the repository
# $2 = namespace to infer
# $3 = ms timeout
# $4 = selectors
# $5 = clone URL
function infer {
  echo "Testing $1"
  if [ ! -d "$1" ]
    then
      git clone $5 $1
  fi
  cp profiles.clj $1/
  cd $1
  #git checkout master -f


  lein with-profiles dev,rti typed infer-all $2 :test-timeout-ms $3 :test-selectors $4 :infer-opts "{:out-dir \"../out/$1\"}"
  cd ..
}

echo "Using core.typed version $CORETYPEDVERSION"

# OK - work out of the box
infer data.codec clojure.data.codec.base64 3000 "[]" https://github.com/clojure/data.codec.git
infer clj-time clj-time.core 200 "[]" https://github.com/clj-time/clj-time.git
infer compojure compojure.core 3000 "[]" https://github.com/weavejester/compojure.git
infer tufte taoensso.tufte 3000 "[]" https://github.com/ptaoussanis/tufte.git
infer brevis-utils brevis-utils.math.matrix 3000 "[]" https://github.com/brevis-us/brevis-utils.git
infer full.core full.core.time 3000 "[]" https://github.com/fullcontact/full.core.git
infer core.match clojure.core.match 3000 "[]" https://github.com/clojure/core.match.git
infer crypto-equality crypto.equality 3000 "[]" https://github.com/weavejester/crypto-equality.git
## Note: slow join, related to keyword singletons
infer utilis utilis.map 3000 "[]" https://github.com/7theta/utilis.git
infer utilis utilis.string 3000 "[]" https://github.com/7theta/utilis.git

# slow
#infer clojurescript cljs.compiler 200 "[cljs.compiler-tests]" https://github.com/clojure/clojurescript.git

# check me
#infer spectrum spectrum.java 3000 "[]" https://github.com/arohner/spectrum.git

# no project.clj
#infer math.combinatorics clojure.math.combinatorics 3000 "[]" https://github.com/clojure/math.combinatorics.git
#infer java.jmx clojure.java.jmx 3000 "[]" https://github.com/clojure/java.jmx.git
#infer java.jdbc clojure.java.jdbc 200 "[]" https://github.com/clojure/java.jdbc.git
#infer data.priority-map clojure.data.priority-map 3000 "[]" https://github.com/clojure/data.priority-map.git
#infer data.json clojure.data.json 3000 "[]" https://github.com/clojure/data.json.git
#infer java.classpath clojure.java.classpath 3000 "[]" https://github.com/clojure/java.classpath.git

# uses midje
#infer fs me.raynes.fs 3000 "[]" https://github.com/Raynes/fs.git

# uses midje, updating midje version works tho (but very bad test coverage)
#infer startrek-clojure startrek.core 3000 "[]" https://github.com/marcusm/startrek-clojure.git

# dependency issues(?) 
#infer data.xml clojure.data.xml 3000 "[]" https://github.com/clojure/data.xml.git
#infer yetibot.core yetibot.core.util 3000 "[]" https://github.com/yetibot/yetibot.core.git

# FIXME analyzer2.jvm does not compile
#infer nippy taoensso.nippy 3000 "[]" https://github.com/ptaoussanis/nippy.git
#infer tools.analyzer.jvm clojure.tools.analyzer.jvm 1000 "[]" https://github.com/clojure/tools.analyzer.jvm.git
#infer data.int-map clojure.data.int-map 3000 "[]" https://github.com/clojure/data.int-map.git
#infer tools.reader clojure.tools.reader 3000 "[]" https://github.com/clojure/tools.reader.git

# FIXME no core.typed cljx support
#infer encore taoensso.encore 3000 "[]" https://github.com/ptaoussanis/encor.git
