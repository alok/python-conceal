" Remove the keywords. We'll re-add them below. Use silent in case the group
" doesn't exist.
silent! syntax clear pythonOperator

" TODO highlight comments correctly
" syntax match pyComment "#" conceal cchar=⍝

" XXX least specific cases at the top, since the match rules seem to be
" cumulative.


" Include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
"
" syntax match pyOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬

" Need to be handled specially for not in to work. Order doesn't matter.
syntax match pyOperator "\<not in\>" conceal cchar=∉
syntax match pyOperator "\<in\>" conceal cchar=∈


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

syntax keyword pyKeyword alpha conceal cchar=α
syntax keyword pyKeyword beta conceal cchar=β
syntax keyword pyKeyword Gamma conceal cchar=Γ
syntax keyword pyKeyword gamma conceal cchar=γ
syntax keyword pyKeyword Delta conceal cchar=Δ
syntax keyword pyKeyword delta conceal cchar=δ
syntax keyword pyKeyword epsilon conceal cchar=ε
syntax keyword pyKeyword zeta conceal cchar=ζ
syntax keyword pyKeyword eta conceal cchar=η
syntax keyword pyKeyword Theta conceal cchar=Θ
syntax keyword pyKeyword theta conceal cchar=θ
syntax keyword pyKeyword kappa conceal cchar=κ
syntax keyword pyKeyword lambda conceal cchar=λ
syntax keyword pyKeyword mu conceal cchar=μ
syntax keyword pyKeyword nu conceal cchar=ν
syntax keyword pyKeyword Xi conceal cchar=Ξ
syntax keyword pyKeyword xi conceal cchar=ξ
syntax keyword pyKeyword Pi conceal cchar=Π
syntax keyword pyKeyword rho conceal cchar=ρ
syntax keyword pyKeyword sigma conceal cchar=σ
syntax keyword pyKeyword tau conceal cchar=τ
syntax keyword pyKeyword upsilon conceal cchar=υ
syntax keyword pyKeyword Phi conceal cchar=Φ
syntax keyword pyKeyword phi conceal cchar=φ
syntax keyword pyKeyword chi conceal cchar=χ
syntax keyword pyKeyword Psi conceal cchar=Ψ
syntax keyword pyKeyword psi conceal cchar=ψ
syntax keyword pyKeyword Omega conceal cchar=Ω
syntax keyword pyKeyword omega conceal cchar=ω

syntax keyword pyKeyword nabla conceal cchar=∇

" like APL
syntax keyword pyKeyword range conceal cchar=⍳
syntax keyword pyKeyword sum conceal cchar=∑

syntax keyword pyConstant None conceal cchar=∅
" http://www.fileformat.info/info/unicode/block/geometric_shapes/images.htm
syntax keyword pyConstant break conceal cchar=◁
syntax keyword pyKeyword return conceal cchar=◀
syntax keyword pyKeyword if conceal cchar=▸
syntax keyword pyKeyword elif conceal cchar=▹
syntax keyword pyKeyword else conceal cchar=▪
syntax keyword pyConstant True conceal cchar=⊤
syntax keyword pyConstant False conceal cchar=⊥
syntax keyword pyKeyword for conceal cchar=∀
syntax keyword pyKeyword while conceal cchar=⥁

" Types
" TODO disable conceal if followed by left paren
"
" syntax match pyKeyword /int/ "me=e-1 conceal cchar=ℤ
" syntax match pyKeyword //int/ ="me=e-2 conceal cchar=ℤ

syntax keyword pyType complex conceal cchar=ℂ
syntax keyword pyType str conceal cchar=𝐒
syntax keyword pyType bool conceal cchar=𝔹

syntax keyword pyType Vector conceal cchar=V
syntax match pyType /np\.ndarray/ conceal cchar=V

syntax match pyType /tf\.Tensor/ conceal cchar=𝕋
syntax match pyType /torch\.Tensor/ conceal cchar=𝕋
syntax match pyType /torch\.Variable/ conceal cchar=𝕋
syntax match pyType /Variable/ conceal cchar=𝕋

syntax keyword pyType float conceal cchar=ℝ
syntax match pyType /np\.float/ conceal cchar=ℝ
syntax match pyType /np\.float32/ conceal cchar=ℝ
syntax match pyType /np\.float64/ conceal cchar=ℝ

syntax match pyType /tf\.float/ conceal cchar=ℝ
syntax match pyType /tf\.float32/ conceal cchar=ℝ
syntax match pyType /tf\.float64/ conceal cchar=ℝ

syntax keyword pyType int conceal cchar=ℤ

syntax match pyType /np\.int/ conceal cchar=ℤ
syntax match pyType /np\.int32/ conceal cchar=ℤ
syntax match pyType /np\.int64/ conceal cchar=ℤ

syntax match pyType /tf\.int/ conceal cchar=ℤ
syntax match pyType /tf\.int32/ conceal cchar=ℤ
syntax match pyType /tf\.int64/ conceal cchar=ℤ


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
"
