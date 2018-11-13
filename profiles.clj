{:rti {:dependencies [[org.typedclojure/core.typed.annotator.jvm #=(eval (System/getenv "CORETYPEDVERSION"))]
                      [org.typedclojure/core.typed.checker.jvm #=(eval (System/getenv "CORETYPEDVERSION"))]
                      [org.clojure/clojure "1.9.0"]]
       :plugins [[lein-typed "0.4.7-SNAPSHOT"]]}}
