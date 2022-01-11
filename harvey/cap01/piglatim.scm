;;;; piglatim.scm
;;;;
;;;; Implementa o exemplo "Pig Latim" do livro Simply Scheme, páginas 10-11,
;;;; conforme a 2ª ed. disponível em: https://people.eecs.berkeley.edu/~bh/ss-toc2.html
;;;;
;;;; Computação Raiz: https://www.youtube.com/computacaoraiz
;;;; Série Pré-SICP: https://www.youtube.com/playlist?list=PLk3bkShxC-bADG9hi7TJhP3cCI-hpfedO


;;; Carrega procedimentos do Simply Scheme
(pre-sicp "simply.scm")


;;; Cria procedimento PIGLATIM:
(define (piglatim palavra)
  (if (member? (first palavra) 'aeiou)
      (word palavra 'ay)
      (piglatim (word (butfirst palavra) (first palavra)))))


;;; Alguns testes:
(piglatim 'porco)

(piglatim 'avião)

(piglatim 'chato)

(piglatim 'elefante)

(piglatim 'spaghetti)
