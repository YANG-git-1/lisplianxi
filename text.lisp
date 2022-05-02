(defun occurrences (x)

        (if (listp (car x))
            x
            (if (member (list (cons (car x) )) x)
                (progn 
                (setf (cdr (assoc (car x) x)) (+ (cdr (assoc (car x) x)) 1)) (occurrences (cdr x ) ))
                (progn 
                (setf x (append x (list (cons (car x) '1)) ))  (occurrences (cdr x) ) )
            )
        )
)
(princ (occurrences '(b a a a a)  ))

;; (princ (copy-tree '(b a a a )))

;; (princ (nth 1 (car '(a (a .1) (b .2)))))


;; (princ (append '((a . 1) (b . 2)) (cons (car '(1 2) ) '1) ))

;; (setf test1 '((a . 1) (b . 2) (c . 3)))
;; (setf avv '(q w e r))
;; (princ (assoc 'a test1))
;; (princ (assoc '2 test1))
;; (setf (nth 0 test1) (cons (car avv) (cdr (nth 0 test1))))
;; (princ test1)
;; (princ test2)
;; (princ (car test1))
;; (princ (cdr (car test1)))
;; (princ (sort '( 1 1 2 2 3) #'>) )