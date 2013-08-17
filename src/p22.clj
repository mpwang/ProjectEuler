; Clojure solution
; much cleaner
(ns euler.p22
  (:use [clojure.string :only [split]]))

(->>
 (split (slurp "names.txt") #",")
 (sort)
 (map-indexed
  (fn [idx name]
    (* (inc idx)
       (apply + (map #(- (int %) 64)
                     (.substring name 1 (dec (.length name))))))))
 (apply +)
 print)
