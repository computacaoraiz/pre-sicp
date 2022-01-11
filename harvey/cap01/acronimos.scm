;;;; acronimos.scm
;;;;
;;;; Implementa o exemplo "Acronyms" do livro Simply Scheme, páginas 8-10,
;;;; conforme a 2ª ed. disponível em: https://people.eecs.berkeley.edu/~bh/ss-toc2.html
;;;;
;;;; Computação Raiz: https://www.youtube.com/computacaoraiz
;;;; Série Pré-SICP: https://www.youtube.com/playlist?list=PLk3bkShxC-bADG9hi7TJhP3cCI-hpfedO


;;; Carrega procedimentos do Simply Scheme:
(pre-sicp "simply.scm")


;;; Define o procedimento ACRONIMO (1ª versão):
(define (acronimo palavras)
  (accumulate word (every first palavras)))


;;; Alguns testes:
(acronimo '(associacao medica brasileira))

(acronimo '(quod erat demonstrandum))

(acronimo '(reduced instruction set computer))


;;; Conseguiu entender como funciona o procedimento ACRONIMO?
;;; Tente entender como funciona cada parte, por exemplo:
(first 'associacao)

(every first '(associacao medica brasileira))

(accumulate word '(a m b))


;;; Note que nem sempre o procedimento funciona a contento:
(acronimo '(sociedade brasileira de computacao))

(acronimo '(structure and interpretation of computer programs))


;;; Define o procedimento ACRONIMO (2ª versão):
(define (acronimo palavras)
  (accumulate word (every first (keep palavra-valida? palavras))))

;;; Helper para verificar se a palavra é válida:
(define (palavra-valida? palavra)
  (not (member? palavra '(and of de do))))


;;; Novos testes:
(acronimo '(sociedade brasileira de pediatria))

(acronimo '(structure and interpretation of computer programs))

(acronimo '(universidade federal do espírito santo))


;;; Conseguiu entender como funciona o helper PALAVRA-VALIDA?
;;; Tente entender como funciona cada parte, por exemplo:
(palavra-valida? 'carro)

(palavra-valida? 'de)

(palavra-valida? '(carro de))      ; por que não funciona aqui?

(keep palavra-valida? '(carro de)) ; e funciona aqui? Descobriu?
