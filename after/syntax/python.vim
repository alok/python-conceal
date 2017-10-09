" remove the keywords. we'll re-add them below
" TODO why is this breaking?
" syntax clear pyOperator


" TODO highlight comments correctly
" syntax match pyComment "#" conceal cchar=⍝


" syntax match pyOperator /\S\.\S/ms=s+1,me=e-1 conceal cchar=∘

" Include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
"
" syntax match pyOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬

" Need to be handled specially for not in to work. Order doesn't matter.
syntax match pyOperator "\<in\>" conceal cchar=∈
syntax match pyOperator "\<not in\>" conceal cchar=∉


syntax match pyOperator ":" conceal cchar=⦂
syntax match pyOperator "->" conceal cchar=→
syntax match pyOperator "<=" conceal cchar=≤
syntax match pyOperator ">=" conceal cchar=≥

syntax match pyOperator /\s@\s/ms=s+1,me=e-1 conceal cchar=⊗
syntax match pySpecial /\s@\s/ms=s+1,me=e-1 conceal cchar=⊗
syntax match pyOperator /\s\*\s/ms=s+1,me=e-1 conceal cchar=∙
syntax match pyOperator /\s=\s/ms=s+1,me=e-1 conceal cchar=←
syntax match pyOperator /\S=\S/ms=s+1,me=e-1 conceal cchar=←

" only conceal “==” if alone, to avoid concealing merge conflict markers
syntax match pyOperator "=\@<!===\@!" conceal cchar=≝
syntax match pyOperator "!=" conceal cchar=≠


syntax match pyOperator "\<\%(math\.\|\)ceil\>" conceal cchar=⌈
 syntax match pyOperator "\<\%(math\.\|\)floor\>" conceal cchar=⌊

" The following are special cases where it *may* be okay to ignore PEP8
syntax match pyOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
syntax match pyOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ
" I have no idea how these work, but I got the transpose working by copying.
syntax match pyOperator "\( \|\)\.\( \|\)T\>" conceal cchar=ᵀ




" like APL
syntax keyword pyKeyword range conceal cchar=⍳
syntax keyword pyKeyword sum conceal cchar=∑

syntax keyword pyKeyword lambda conceal cchar=λ
syntax keyword pyConstant None conceal cchar=∅
syntax keyword pyKeyword return conceal cchar=⏎
syntax keyword pyConstant False conceal cchar=⊥
syntax keyword pyConstant True conceal cchar=⊤
syntax keyword pyKeyword for conceal cchar=∀
syntax keyword pyKeyword while conceal cchar=⥁

" types
" TODO disable conceal if followed by left paren
" syntax match pyKeyword "\vint "me=e-1 conceal cchar=ℤ
" syntax match pyKeyword "\vint ="me=e-2 conceal cchar=ℤ

syntax keyword pyType int conceal cchar=ℤ
syntax keyword pyType float conceal cchar=ℝ
syntax keyword pyType complex conceal cchar=ℂ
syntax keyword pyType str conceal cchar=𝐒
syntax keyword pyType bool conceal cchar=𝔹
syntax keyword pyType Vector conceal cchar=V
syntax match pyType /np\.ndarray/ conceal cchar=V
syntax match pyType /tf\.Tensor/ conceal cchar=𝕋
syntax match pyType /torch\.Tensor/ conceal cchar=𝕋
syntax match pyType /torch\.Variable/ conceal cchar=𝕋
syntax match pyType /Variable/ conceal cchar=𝕋

syntax match pyKeyword /\vnp\.arange/ conceal cchar=⍳

syntax match pyKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π

highlight! link pyBuiltin pyOperator
highlight! link pyOperator Operator
highlight! link pyStatement Statement
highlight! link pyKeyword Keyword
highlight! link pyComment Comment
highlight! link pyConstant Constant
highlight! link pySpecial Special
highlight! link pyIdentifier Identifier
highlight! link pyType Type

" changing this changes the color of vim's conceal
highlight! link Conceal Operator
" highlight! link Conceal PreProc


setlocal conceallevel=1

" unused ideas

" syntax keyword pyBuiltin all conceal cchar=∀
" syntax keyword pyBuiltin any conceal cchar=∃
