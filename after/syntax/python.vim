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

" Subscripts


" Matches x0 -> x₀ A2 -> A₂ word2 -> word₂
" Use ms=s+1 to avoid concealing the letter before the number
syntax match Normal '\v<[[:alpha:]_]+0>'ms=e conceal cchar=₀
syntax match Normal '\v<[[:alpha:]_]+1>'ms=e conceal cchar=₁
syntax match Normal '\v<[[:alpha:]_]+2>'ms=e conceal cchar=₂
syntax match Normal '\v<[[:alpha:]_]+3>'ms=e conceal cchar=₃
syntax match Normal '\v<[[:alpha:]_]+4>'ms=e conceal cchar=₄
syntax match Normal '\v<[[:alpha:]_]+5>'ms=e conceal cchar=₅
syntax match Normal '\v<[[:alpha:]_]+6>'ms=e conceal cchar=₆
syntax match Normal '\v<[[:alpha:]_]+7>'ms=e conceal cchar=₇
syntax match Normal '\v<[[:alpha:]_]+8>'ms=e conceal cchar=₈
syntax match Normal '\v<[[:alpha:]_]+9>'ms=e conceal cchar=₉

" Numbers
syntax match Normal '\v[^_]\zs_0\ze>' conceal cchar=₀
syntax match Normal '\v[^_]\zs_1\ze>' conceal cchar=₁
syntax match Normal '\v[^_]\zs_2\ze>' conceal cchar=₂
syntax match Normal '\v[^_]\zs_3\ze>' conceal cchar=₃
syntax match Normal '\v[^_]\zs_4\ze>' conceal cchar=₄
syntax match Normal '\v[^_]\zs_5\ze>' conceal cchar=₅
syntax match Normal '\v[^_]\zs_6\ze>' conceal cchar=₆
syntax match Normal '\v[^_]\zs_7\ze>' conceal cchar=₇
syntax match Normal '\v[^_]\zs_8\ze>' conceal cchar=₈
syntax match Normal '\v[^_]\zs_9\ze>' conceal cchar=₉
" Letters
syntax match Normal '\v[^_]\zs_[aA]\ze>' conceal cchar=ₐ
syntax match Normal '\v[^_]\zs_[lL]\ze>' conceal cchar=ₗ
syntax match Normal '\v[^_]\zs_[pP]\ze>' conceal cchar=ₚ
syntax match Normal '\v[^_]\zs_[rR]\ze>' conceal cchar=ᵣ
syntax match Normal '\v[^_]\zs_[sS]\ze>' conceal cchar=ₛ
syntax match Normal '\v[^_]\zs_[uU]\ze>' conceal cchar=ᵤ
syntax match Normal '\v[^_]\zs_[vV]\ze>' conceal cchar=ᵥ
syntax match Normal '\v[^_]\zs_[xX]\ze>' conceal cchar=ₓ	
syntax match Normal '\v[^_]\zs_[hH]\ze>' conceal cchar=ₕ
syntax match Normal '\v[^_]\zs_[iI]\ze>' conceal cchar=ᵢ
syntax match Normal '\v[^_]\zs_[jJ]\ze>' conceal cchar=ⱼ
syntax match Normal '\v[^_]\zs_[kK]\ze>' conceal cchar=ₖ
syntax match Normal '\v[^_]\zs_[nN]\ze>' conceal cchar=ₙ
syntax match Normal '\v[^_]\zs_[mM]\ze>' conceal cchar=ₘ
syntax match Normal '\v[^_]\zs_[tT]\ze>' conceal cchar=ₜ

" Need to be handled specially for `not in` to work. Order doesn't matter.
syntax match pyOperator '\v<not in>' conceal cchar=∉
syntax match pyOperator '\v<in>' conceal cchar=∈


syntax match pyOperator '->' conceal cchar=→
syntax match pyOperator '<=' conceal cchar=≤
syntax match pyOperator '>=' conceal cchar=≥

syntax match pyOperator '\s@\s'ms=s+1,me=e-1 conceal cchar=⊗
syntax match pyOperator '\s\*\s'ms=s+1,me=e-1 conceal cchar=∙
" syntax match pyOperator '\v(\+|-|*|/|\%)@!\=' conceal cchar=←
syntax match pyOperator '\v[^-=+*/]\zs\=\ze[^=]' conceal cchar=←
syntax match pyOperator '\v\=@<!\=\=\=@!' conceal cchar=≝


" only conceal `==` if alone, to avoid concealing merge conflict markers
syntax match pyOperator '!=' conceal cchar=≠


syntax match pyKeyword '\v<((math|torch|np|tf|scipy|sp)\.)?ceil>' conceal cchar=⌈
syntax match pyKeyword '\v<((math|torch|np|tf|scipy|sp)\.)?floor>' conceal cchar=⌊
syntax match pyKeyword '\v<((torch|np|tf|scipy|sp)\.)?(eye|identity)>' conceal cchar=𝕀
syntax match pyKeyword '\v<((math|np|scipy|sp)\.)e>' conceal cchar=ℯ

syntax match pyKeyword '\v<((math|torch|np|tf|scipy|sp)\.)?pi>' conceal cchar=π
syntax match pyKeyword '\v<((torch|np|scipy|sp)\.mean)|(tf\.reduce_mean)>' conceal cchar=𝔼


syntax match pyOperator '\v\zs ?\*\* ?2\ze>([^.]|$)' conceal cchar=²
syntax match pyOperator '\v\zs ?\*\* ?n\ze>([^.]|$)' conceal cchar=ⁿ
syntax match pyOperator '\v\zs ?\*\* ?i\ze>([^.]|$)' conceal cchar=ⁱ	
syntax match pyOperator '\v\zs ?\*\* ?j\ze>([^.]|$)' conceal cchar=ʲ
syntax match pyOperator '\v\zs ?\*\* ?k\ze>([^.]|$)' conceal cchar=ᵏ
syntax match pyOperator '\v\zs ?\*\* ?t\ze>([^.]|$)' conceal cchar=ᵗ
syntax match pyOperator '\v\zs ?\*\* ?x\ze>([^.]|$)' conceal cchar=ˣ
syntax match pyOperator '\v\zs ?\*\* ?y\ze>([^.]|$)' conceal cchar=ʸ
syntax match pyOperator '\v\zs ?\*\* ?z\ze>([^.]|$)' conceal cchar=ᶻ
syntax match pyOperator '\v\zs ?\*\* ?a\ze>([^.]|$)' conceal cchar=ᵃ
syntax match pyOperator '\v\zs ?\*\* ?b\ze>([^.]|$)' conceal cchar=ᵇ
syntax match pyOperator '\v\zs ?\*\* ?c\ze>([^.]|$)' conceal cchar=ᶜ
syntax match pyOperator '\v\zs ?\*\* ?d\ze>([^.]|$)' conceal cchar=ᵈ
syntax match pyOperator '\v\zs ?\*\* ?e\ze>([^.]|$)' conceal cchar=ᵉ
syntax match pyOperator '\v\zs ?\*\* ?p\ze>([^.]|$)' conceal cchar=ᵖ
syntax match pyOperator '\v\zs ?\*\* ?l\ze>([^.]|$)' conceal cchar=ˡ
syntax match pyOperator '\v\zs ?\*\* ?m\ze>([^.]|$)' conceal cchar=ᵐ

" no ending word boundary on parens
syntax match pyOperator '\v\.t\(\)' conceal cchar=ᵀ
syntax match pyOperator '\v\.T>' conceal cchar=ᵀ

syntax match pyOperator '\v\.inverse\(\)' conceal cchar=⁻

syntax match pyOperator '\v\.reshape>'ms=s conceal cchar=♚

syntax match pyOperator '<<' conceal cchar=≺
syntax match pyOperator '>>' conceal cchar=≻

syntax keyword pyKeyword alpha ALPHA conceal cchar=α
syntax keyword pyKeyword beta BETA conceal cchar=β
syntax keyword pyKeyword Gamma conceal cchar=Γ
syntax keyword pyKeyword gamma GAMMA conceal cchar=γ
syntax keyword pyKeyword Delta conceal cchar=Δ
syntax keyword pyKeyword delta DELTA conceal cchar=δ
syntax keyword pyKeyword epsilon EPSILON conceal cchar=ε
syntax keyword pyKeyword zeta ZETA conceal cchar=ζ
syntax keyword pyKeyword eta ETA conceal cchar=η
syntax keyword pyKeyword Theta conceal cchar=ϴ
syntax keyword pyKeyword theta THETA conceal cchar=θ
syntax keyword pyKeyword kappa KAPPA conceal cchar=κ
syntax keyword pyKeyword lambda LAMBDA lambda_ _lambda conceal cchar=λ
syntax keyword pyKeyword mu MU conceal cchar=μ
syntax keyword pyKeyword nu NU conceal cchar=ν
syntax keyword pyKeyword Xi conceal cchar=Ξ
syntax keyword pyKeyword xi XI conceal cchar=ξ
syntax keyword pyKeyword Pi conceal cchar=Π
syntax keyword pyKeyword rho RHO conceal cchar=ρ
syntax keyword pyKeyword sigma SIGMA conceal cchar=σ
syntax keyword pyKeyword tau TAU conceal cchar=τ
syntax keyword pyKeyword upsilon UPSILON conceal cchar=υ
syntax keyword pyKeyword Phi conceal cchar=Φ
syntax keyword pyKeyword phi PHI conceal cchar=φ
syntax keyword pyKeyword chi CHI conceal cchar=χ
syntax keyword pyKeyword Psi conceal cchar=Ψ
syntax keyword pyKeyword psi PSI conceal cchar=ψ
syntax keyword pyKeyword Omega conceal cchar=Ω
syntax keyword pyKeyword omega OMEGA conceal cchar=ω
syntax keyword pyKeyword nabla NABLA conceal cchar=∇

" like APL
syntax keyword pyKeyword range conceal cchar=⍳
syntax keyword pyKeyword enumerate conceal cchar=↑


syntax keyword pyConstant None conceal cchar=∅
" http://www.fileformat.info/info/unicode/block/geometric_shapes/images.htm
syntax keyword pyConstant break conceal cchar=◁
syntax keyword pyKeyword continue conceal cchar=↻
syntax keyword pyKeyword return conceal cchar=◀
syntax keyword pyKeyword if conceal cchar=▸
syntax keyword pyKeyword elif conceal cchar=▹
syntax keyword pyKeyword else conceal cchar=▪
syntax keyword pyConstant True conceal cchar=⊤
syntax keyword pyConstant False conceal cchar=⊥
syntax keyword pyKeyword for conceal cchar=∀
syntax keyword pyKeyword while conceal cchar=⥁

syntax keyword pyKeyword def conceal cchar=λ
syntax keyword pyKeyword class conceal cchar=※
" syntax keyword pyKeyword assert conceal cchar=‽
syntax match pyKeyword 'yield from' conceal cchar=⇄
syntax keyword pyKeyword yield conceal cchar=⇇
syntax keyword pyKeyword self conceal cchar=⚕

syntax keyword pyType Vector conceal cchar=V
syntax match pyType '(np|scipy|sp)\.ndarray' conceal cchar=V
syntax match pyType '\vtf\.Tensor' conceal cchar=𝕋
syntax match pyType '\vtorch\.[tT]ensor' conceal cchar=𝕋
syntax keyword pyType tensor Tensor conceal cchar=𝕋
syntax match pyType '\v(torch|np|tf|scipy|sp)\.float(32|64)?' conceal cchar=ℝ
syntax match pyType '\v(torch|np|tf|scipy|sp)\.int(32|64)?' conceal cchar=ℤ

" XXX These have to be after all the float{16,32} stuff to avoid accidental
" capture. Use @! to ensure that type casts are not concealed, since that's
" hard to read._
"
" [^\s)] is to avoid the edge case of (x: int) where the right paren would
" override the int conceal.
syntax match pyType '\v<int(\(|[^\s)\],:])@!' conceal cchar=ℤ
syntax match pyType '\v<float(\(|[^\s)\],:])@!' conceal cchar=ℝ
syntax match pyType '\v<complex(\(|[^\s)\],:])@!' conceal cchar=ℂ
syntax match pyType '\v<str(\(|[^\s)\],:])@!' conceal cchar=𝐒
syntax match pyType '\v<bool(\(|[^\s)\],:])@!' conceal cchar=𝔹

syntax match pyKeyword '\v((np|scipy|sp|torch)\.)?arange' conceal cchar=⍳

syntax keyword pyBuiltin all
syntax keyword pyBuiltin any conceal cchar=∃

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
highlight! link Conceal Normal
" highlight! link Conceal PreProc


setlocal conceallevel=2

" unused ideas

