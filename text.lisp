(defun pos+ (x)
    (let ((i -1))
        (mapcar #'(lambda (y) (setf y (+ y (setf i (+ i 1)) )  )) x) 
    )      
)

(princ (pos+ '(1 10 100 1000)))