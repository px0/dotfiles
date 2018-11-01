{:user {:dependencies [
                       [im.chit/vinyasa.inject "0.4.2"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       ]
        :plugins [[lein-try "0.4.3"] ; try packages
                  [lein-ancient "0.6.8"] ; find outdated packages
                  [lein-cljfmt "0.3.0"]
                  [lein-plz "0.4.0-SNAPSHOT" :exclusions [[rewrite-clj] [ancient-clj]]]
                  [jonase/eastwood "0.2.3"] ;checks clojure code
                  [lein-kibit "0.1.2"] ;checks clojure code
                  [venantius/ultra "0.4.0"] ; http://blog.venanti.us/ultra/
                  ]}
 :injections [
              (require '[vinyasa.inject :as inject])
              (inject/in ;; the default injected namespace is `.`
                         [clojure.pprint pprint]
                         [clojure.java.shell sh]
                         [clojure.tools.namespace.repl refresh]
                         [clojure.repl doc source]

                         clojure.core
                         [clojure.pprint pprint]
                         [clojure.repl doc source]
                        )]


 :repl {:plugins []
        :repl-options {:init (set! *print-length* 100)}}}


;;http://blog.maio.cz/2015/11/cider-slows-down-leiningen-startup-here.html
