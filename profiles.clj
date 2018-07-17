{:rti {:dependencies [[org.clojure/core.typed #=(eval (System/getenv "CORETYPEDVERSION"))]
                      [org.clojure/clojure "1.9.0"]]
       :plugins [[lein-typed "0.4.6"]]}}
