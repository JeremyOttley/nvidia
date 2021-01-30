;;;;;;;;;;;
;; TASKS ;;
;;;;;;;;;;;

(deftask fmt 
  "fmt file or dir using cljfmt (changes files)"
  [f files VAL str "file(s) to format"]
  (set-env! :dependencies '[[cljfmt "0.3.0"]])
  (require 'cljfmt.core
           'clojure.java.io)
  (let [reformat-string (resolve 'cljfmt.core/reformat-string)
        file (resolve 'clojure.java.io/file)
        fmt-file (fn [f]
                   (println "formatting" (.getName f))
                   (spit f (reformat-string (slurp f))))
        clj-file? (fn [f]
                    (and (.exists f) (.isFile f) (not (.isHidden f))
                         (contains? #{"clj" "cljs" "cljc" "cljx" "boot"} 
                                    (last (.split (.toLowerCase (.getName f)) "\\.")))))
        f (file files)]
    (when (.exists f)
      (doall (map fmt-file (filter clj-file? (if (.isDirectory f) (file-seq f) [f])))))))
