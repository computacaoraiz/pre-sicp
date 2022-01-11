;;;; fatorial.scm
;;;;
;;;; Implementa o exemplo "Factorial" do livro Simply Scheme, páginas 14-15,
;;;; conforme a 2ª ed. disponível em: https://people.eecs.berkeley.edu/~bh/ss-toc2.html
;;;;
;;;; Computação Raiz: https://www.youtube.com/computacaoraiz
;;;; Série Pré-SICP: https://www.youtube.com/playlist?list=PLk3bkShxC-bADG9hi7TJhP3cCI-hpfedO


;;; Bibliotecas do Simply Scheme:
(pre-sicp "simply.scm")


;;; Define o procedimento FATORIAL:
(define (fatorial n)
  (if (= n 0)
      1
      (* n (fatorial (- n 1)))))


;;; Testes do procedimento FATORIAL:
(fatorial 5)

(fatorial 1000)


;;; O que ocorre se passarmos um número negativo?
(fatorial -1)
