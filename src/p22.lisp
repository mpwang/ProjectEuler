(defun p22 ()
  (with-open-file (txt "names.txt")
        (regexp:with-loop-split (names txt ",")
   (princ (loop for pos = 1 then (1+ pos)
                                for str in (sort names #'string<)
                                sum (score str pos) into scores
                                finally (return scores))))))

(defun score (str pos)
  (* pos (loop for ch across (subseq str 1 (1- (length str)))
                           sum (1+ (- (char-int ch) (char-int #\A))))))
(p22)
