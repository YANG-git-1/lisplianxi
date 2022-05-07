(defun showdots (x)

    (if (equal (length x) 0)
        (let ((y '(1 . 2)))
            (setf (car y) (car x) )
            y
        )

        (
            (append (list (car x)) (list (showdots (cdr x))))
        )
    )
)
(princ (showdots '(a b c d)))

;; (princ (setf (cdr '(1 . 2)) '12)  )
;; (princ (type-of '(a)))
;; (princ (type-of 'a))
;; (append (list (car x)) (list (showdots (cdr x))))