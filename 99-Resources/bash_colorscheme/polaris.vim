"%% SiSU Vim color file
" Polaris Maintainer: Stanislas Rouyer <stanislas.rouyer@gmail.com>
" highlight link diffAdded String
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
let colors_name = "Polaris"
:hi Comment      ctermfg=7              guifg=#ffffff term=bold            
:hi CommentH1    ctermfg=0              ctermbg=15              guifg=#ffffff term=bold            
:hi Shebang      ctermfg=11              guifg=#ffffff term=bold            
:hi Constant     ctermfg=4              guifg=#ffa0a0        
:hi Cursor       ctermfg=11              guibg=khaki guifg=slategrey
:hi Define       ctermfg=11              guifg=gold  gui=bold            
:hi DiffAdd      ctermfg=11              ctermbg=4
:hi DiffChange   ctermfg=11              ctermbg=5
:hi DiffDelete   ctermfg=11              ctermbg=6   cterm=bold           
:hi DiffText     ctermfg=11              ctermbg=1   cterm=bold           
:hi Directory    ctermfg=11       
:hi Error        ctermfg=11              ctermbg=1   cterm=bold  guifg=White guibg=Red           
:hi ErrorMsg     ctermfg=7              ctermbg=DarkRed  cterm=bold   guifg=White guibg=Red       
:hi FoldColumn   ctermfg=11              ctermbg=7   guibg=black guifg=grey20        
:hi Folded       ctermfg=11              ctermbg=darkgrey    guibg=black guifg=grey40        
:hi Function     ctermfg=brown              guifg=navajowhite    
:hi Identifier   ctermfg=DarkMagenta              guifg=black          
:hi Ignore       ctermfg=11              cterm=bold  guifg=grey40         
:hi IncSearch    ctermfg=11              ctermbg=DarkRed cterm=none  guifg=green guibg=black         
:hi Include      ctermfg=11              guifg=red            
:hi LineNr       ctermfg=10              guifg=grey50         
:hi ModeMsg      ctermfg=11              cterm=none  guifg=goldenrod                
:hi MoreMsg      ctermfg=11              guifg=SeaGreen       
:hi NonText      ctermfg=11              cterm=bold  guifg=RoyalBlue guibg=grey15        
:hi Normal       ctermfg=12              guifg=White guibg=grey15
:hi Operator     ctermfg=6              guifg=Red            
:hi PreProc      ctermfg=DarkRed              guifg=red   guibg=white         
:hi Question     ctermfg=11              guifg=springgreen    
:hi Search       ctermfg=11              ctermbg=blue cterm=none guibg=peru  guifg=wheat         
:hi Special      ctermfg=4              guifg=darkkhaki      
:hi SpecialKey   ctermfg=11              guifg=yellowgreen    
:hi SpellErrors  ctermfg=11              ctermbg=1    cterm=bold guifg=White guibg=Red           
:hi Statement    ctermfg=4              guifg=CornflowerBlue 
:hi StatusLine   ctermfg=11              cterm=bold,reverse  guibg=#c2bfa5   guifg=black gui=none        
:hi StatusLineNC ctermfg=11              cterm=reverse   guibg=#c2bfa5   guifg=grey40   gui=none        
:hi String       ctermfg=2              guifg=SkyBlue        
:hi Structure    ctermfg=11              guifg=green          
:hi Title        ctermfg=11              cterm=bold  guifg=gold  gui=bold            
:hi Todo         ctermfg=11              guifg=orangered guibg=yellow2
:hi Type         ctermfg=11              guifg=CornflowerBlue 
:hi Underlined   ctermfg=11              cterm=underline      
:hi VertSplit    ctermfg=11              cterm=reverse   guibg=#c2bfa5        guifg=grey40        gui=none        
:hi Visual       ctermfg=11              cterm=reverse   gui=none             guifg=khaki         guibg=olivedrab 
:hi VisualNOS    ctermfg=11              cterm=bold,underline
:hi WarningMsg   ctermfg=11              guifg=salmon ctermfg=15
:hi WildMenu     ctermfg=11              ctermbg=3
