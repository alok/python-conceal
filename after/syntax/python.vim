" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" remove the keywords. we'll re-add them below
" TODO why is this breaking?
" syntax clear pythonOperator

syntax match pythonOperator "\<is\>"

syntax match pyNiceOperator /\S\.\S/ms=s+1,me=e-1 conceal cchar=∘

" syntax match pyNiceOperator  ms=s+1,me=e-1  conceal cchar=∘
" syntax match pyNiceOperator /\s\.\s/ms=s+1,me=e-1 conceal cchar=∘

syntax match pyNiceOperator "\<in\>" conceal cchar=∈
syntax match pyNiceOperator "\<or\>" conceal cchar=∨
syntax match pyNiceOperator "\<and\>" conceal cchar=∧
" include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
syntax match pyNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match pyNiceOperator "\<not in\>" conceal cchar=∉
syntax match pyNiceOperator "<=" conceal cchar=≤
syntax match pyNiceOperator ">=" conceal cchar=≥
" only conceal “==” if alone, to avoid concealing SCM conflict markers
syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≝
syntax match pyNiceOperator "!=" conceal cchar=≠

syntax keyword pyNiceOperator sum conceal cchar=∑
syntax keyword pyNiceBuiltin all conceal cchar=∀
syntax keyword pyNiceBuiltin for conceal cchar=∀
syntax keyword pyNiceBuiltin in conceal cchar=∈
syntax keyword pyNiceBuiltin any conceal cchar=∃
syntax match pyNiceOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π
syntax match pyNiceOperator "\<\%(math\.\|\)ceil\>" conceal cchar=⌈
 syntax match pyNiceOperator "\<\%(math\.\|\)floor\>" conceal cchar=⌊

syntax keyword pyNiceStatement int conceal cchar=ℤ
syntax keyword pyNiceStatement float conceal cchar=𝔽
syntax keyword pyNiceStatement complex conceal cchar=ℂ

" syntax match pyNiceOperator " \* " conceal cchar=∙
" syntax match pyNiceOperator " / " conceal cchar=÷
"
" The following are special cases where it *may* be okay to ignore PEP8
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ

syntax match pyNiceSpecial "\<False\>" conceal cchar=Ƒ
syntax match pyNiceSpecial "False" conceal cchar=𝐅
syntax keyword pyNiceSpecial False conceal cchar=𝐅
syntax keyword pyNiceKeyword False conceal cchar=𝐅
syntax match pyNiceSpecial "\<True\>" conceal cchar=𝐓
syntax match pyNiceSpecial "True" conceal cchar=𝐓
syntax keyword pyNiceSpecial True conceal cchar=𝐓
syntax keyword pyNiceKeyword True conceal cchar=𝐓
syntax match pyNiceOperator /\s=\s/ms=s+1,me=e-1 conceal cchar=←
" syntax match pyNiceOperator /\s=\s/ms=s+1,me=e-1 conceal cchar=→
" syntax match pythonComment /\v#/ conceal cchar=⍝
" highlight link pythonComment Comment
syntax match pyNiceOperator /\S=\S/ms=s+1,me=e-1 conceal cchar=←
" syntax match pyNiceOperator /\S=\S/ms=s+1,me=e-1 conceal cchar=→

" Your background, and taste, may affect whether you like # for cardinality ;)
syntax keyword pyNiceBuiltin len conceal cchar=𝕃
syntax keyword pyNiceOperator print conceal cchar=⎙
syntax keyword pyNiceOperator return conceal cchar=⏎
syntax keyword pyNiceOperator break conceal cchar=↰
syntax keyword pyNiceOperator continue conceal cchar=↴

syntax keyword pyNiceStatement lambda conceal cchar=λ
syntax match pyNiceOperator lambda conceal cchar=λ
syntax keyword pyNiceStatement None conceal cchar=∅

hi link pyNiceOperator Operator
hi link pyNiceStatement Statement
hi link pyNiceKeyword Keyword
hi link pyNiceBuiltin Builtin
hi! link Conceal Operator

setlocal conceallevel=1
