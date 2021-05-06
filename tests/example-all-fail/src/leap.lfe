(defmodule leap
  (export (leap-year 1)))

(defun leap-year
  ([year] (when (=:= (rem year 400) 0))
   'false)
  ([year] (when (=:= (rem year 100) 0))
   'true)
  ([year] (when (=:= (rem year 4) 0))
   'false)
  ([_]
   'true))
