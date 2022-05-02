# Chapter 3 习题 (Exercises)
## 用箱子表示法表示以下列表：
* (a) (a b (c d))
* (b) (a (b (c (d))))
* (c) (((a b) c) d)
* (d) (a (b . c) d)

![图片](./1.jpg)

## 写一个保留原本列表中元素顺序的 union 版本：

                (new-union '(a b c) '(b a d))
                (A B C D)

-----------------
                (defun new-union (x y)
                    (if (null (car y))
                    x
                    (if (member (car y) x)
                    (new-union x (cdr y))
                        (progn 
                        (setf x (append x (cons (car y) ())))
                        (new-union x (cdr y))
                ))))

## 定义一个函数，接受一个列表并返回一个列表，指出相等元素出现的次数，并由最常见至最少见的排序：

                (occurrences '(a b a d a c d c a))
                ((A . 4) (C . 2) (D . 2) (B . 1))