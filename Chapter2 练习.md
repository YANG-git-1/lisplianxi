# Chapter 2 习题 (Exercises)
## 描述下列表达式求值之后的结果：

* (a) (+ (- 5 1) (+ 3 7))
    *14*

* (b) (list 1 (+ 2 3))
    *(1 5)*
* (c) (if (listp 1) (+ 1 2) (+ 3 4))
    *7*
* (d) (list (and (listp 3) t) (+ 1 2))
    *(NIL 3)*

## 给出 3 种不同表示 (a b c) 的 cons 表达式 。
                (list 'a '(a b c))
                (let 'a '(a b c))
                (cons 'a '(b c))

## 使用 car 与 cdr 来定义一个函数，返回一个列表的第四个元素。
                (defun forth (lst)
                    (
                    car (cdr (cdr (cdr lst)))
                    )
                )

## 定义一个函数，接受两个实参，返回两者当中较大的那个。
                (defun cp (a b)
                    (
                        if (>= a b)
                        (princ a)
                        (princ b) 
                    )
                )
## 这些函数做了什么？   
                (defun enigma (x)
                    (and (not (null x));;判断x是否空
                        (or (null (car x));;判断取出的值是否空 
                            (enigma (cdr x)))))     
**判断x中是否有空值**   **有空值返回true** **无则返回NIL**  

---------------------
                (defun mystery (x y)
                    (if (null y)
                        nil
                        (if (eql (car y) x)
                            0
                            (let ((z (mystery x (cdr y))))
                                (and z (+ z 1))))))
 **返回第一个与x相等的y的成员的序列**

 ## 下列表达式， x 该是什么，才会得到相同的结果？   
    (a) > (car (x (cdr '(a (b c) d))))
        B                         
*car*

    (b) > (x 13 (/ 1 0))
        13
*or*

    (c) > (x #'list 1 nil)
        (1)
*apply*

## 只使用本章所介绍的操作符，定义一个函数，它接受一个列表作为实参，如果有一个元素是列表时，就返回真。给出函数的迭代与递归版本：
* 接受一个正整数，并打印出数字数量的点。
  * 迭代

        (defun pp (x)
            (do ((i x (- i 1)))
                ((eql i 0) 'done)
                (princ #\.)
            )
        )
  * 递归
  

        (defun pp (x)
            (if (eql x 0)
            NIL
            (progn
            (princ #\.)
            (pp (- x 1)))
        )
        )  


* 接受一个列表，并返回 a 在列表里所出现的次数。
  * 迭代

        (defun atimes (x)
            (let ((tim 0)) 
                (do ((i x (setf i (cdr i))))
                    ((eql nil (car i)) tim)
                    (if (eql (car i) 'a)
                        (setf tim (+ tim 1))
                        ()
                    )
                )
            )
        )

  * 递归

        (defun atimes (x)
            (if (null x)
                0
                (if (eql (car x) 'a)
                    (let ((z (atimes (cdr x))))
                        (setf z (+ z 1)))
                    (atimes (cdr x))
                )
            )
        )

## 一位朋友想写一个函数，返回列表里所有非 nil 元素的和。他写了此函数的两个版本，但两个都不能工作。请解释每一个的错误在哪里，并给出正确的版本。
                (defun summit (lst)
                    (remove nil lst)
                    (apply #'+ lst))

remove 并没有改变lst的值
修改后如下

                (defun summit (lst)
                    (apply #'+ (remove nil lst)))

----------------------
                (defun summit (lst)
                    (let ((x (car lst)))
                        (if (null x)
                            (summit (cdr lst))
                            (+ x (summit (cdr lst))))))

递归无法结束最后会无限循环
修改后如下


                (defun summit (lst)
                    (let ((x (car lst)))
                        (if (eql (cdr lst) x)
                        0
                        (if (null x)
                            (summit (cdr lst))
                            (+ x (summit (cdr lst)))))))