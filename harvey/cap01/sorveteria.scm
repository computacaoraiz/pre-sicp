;;;; sorveteria.scm
;;;;
;;;; Implementa o exemplo "Ice Cream Choices" do livro Simply Scheme, página 12,
;;;; conforme a 2ª ed. disponível em: https://people.eecs.berkeley.edu/~bh/ss-toc2.html
;;;;
;;;; Computação Raiz: https://www.youtube.com/computacaoraiz
;;;; Série Pré-SICP: https://www.youtube.com/playlist?list=PLk3bkShxC-bADG9hi7TJhP3cCI-hpfedO


;;; Carrega bibliotecas do Simply Scheme
(pre-sicp "simply.scm")


;;; Cria procedimento MENU:
(define (menu opcoes)
  (if (null? opcoes)
      '(())
      (let ((smaller (menu (cdr opcoes))))
        (reduce append
                (map (lambda (item) (prepend-every item smaller))
                     (car opcoes))))))


;;; Procedimento auxiliar: 
(define (prepend-every item lst)
  (map (lambda (opcao) (se item opcao)) lst))


;;; Testes do procedimento MENU:
;;; (note que não é necessário informar previamente o número de categorias das
;;; opções, nem mesmo o número de opções em cada categoria!)
(menu '())

(menu '(
        (baunilha (chocolate amargo) (chocolate branco) morango)
        ))

(menu '(
        (baunilha (chocolate amargo) (chocolate branco) morango)
        (copo casquinha)
        ))

(menu '(
        (baunilha (chocolate amargo) (chocolate branco) morango)
        (copo casquinha)
        (pequeno medio grande)
        ))

(menu '(
        (baunilha (chocolate amargo) (chocolate branco) morango)
        (copo casquinha)
        (pequeno medio grande)
        (normal superior)
        ))

(menu '(
        (baunilha (chocolate amargo) (chocolate branco) morango)
        (copo casquinha)
        (pequeno medio grande)
        (normal super)
        (gelado morno quente)
        ))
