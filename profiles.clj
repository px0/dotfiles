{:user 
 {:dependencies [[org.clojars.gjahad/debug-repl "0.3.3"]
                 [im.chit/vinyasa "0.1.8"]
                 [difform "1.1.2"]]
  :injections [(require 'vinyasa.inject)
               (require 'alex-and-georges.debug-repl)
               (require 'com.georgejahad.difform)
               (vinyasa.inject/inject 'clojure.core '>
                                      '[[clojure.repl doc source]
                                        [clojure.pprint pprint pp]
                                        [alex-and-georges.debug-repl debug-repl]
                                        [com.georgejahad.difform difform]])]
  :plugins [[lein-try "0.4.3"]
            [cider/cider-nrepl "0.7.0"]
            [lein-exec "0.3.4"]]}}
