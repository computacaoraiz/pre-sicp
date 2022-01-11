;;;; combinacoes.scm
;;;;
;;;; Implementa o exemplo "Combinations from a Set" do livro Simply Scheme, página 13,
;;;; conforme a 2ª ed. disponível em: https://people.eecs.berkeley.edu/~bh/ss-toc2.html
;;;;
;;;; Computação Raiz: https://www.youtube.com/computacaoraiz
;;;; Série Pré-SICP: https://www.youtube.com/playlist?list=PLk3bkShxC-bADG9hi7TJhP3cCI-hpfedO


;;; Carrega bibliotecas do Simply Scheme
(pre-sicp "simply.scm")


;;; Cria procedimento COMBINACOES:
(define (combinacoes tamanho conjunto)
  (cond ((= tamanho 0) '(()))
        ((empty? conjunto) '())
        (else (append (prepend-every (first conjunto)
                                     (combinacoes (- tamanho 1)
                                                  (butfirst conjunto)))
                      (combinacoes tamanho (butfirst conjunto))))))

;;; Procedimento helper:
(define (prepend-every item lst)
  (map (lambda (escolha) (se item escolha)) lst))


;;; Testes de COMBINACOES:
(combinacoes 2 '(joao maria luiz renata antonio juliana))

(combinacoes 3 '(joao maria luiz renata antonio juliana))

(combinacoes 4 '(joao maria luiz renata antonio juliana))
