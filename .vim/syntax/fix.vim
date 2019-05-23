syntax match msgtype     "35=."
syntax match msgtype     "150=."
syntax match reject      "150=8"
syntax match heartbeat   "8=FIX\.4.*35=0.*$"
syntax match leadingtime "^\d\{4}-\=\d\{2}-\=\d\{2}\(T\|-\)\d\{2}:\d\{2}:\d\{2}.\d*"
syntax match text        "58=.\{-}\%d1"

syntax match clordid     "11=.\{-}\%d1"
syntax match origclordid "41=.\{-}\%d1"
syntax match correlationid "9717=.\{-}\%d1"
syntax match symbol "\(55\|107\)=.\{-}\%d1"
syntax match price "44=.\{-}\%d1"
syntax match qty "38=.\{-}\%d1"
syntax match side "54=.\{-}\%d1"

highlight link separator Ignore
highlight link heartbeat Ignore
match separator /\%d1/

highlight link msgtype StatusLine
highlight link reject Error
highlight link text Statement
highlight link clordid      ModeMsg
highlight link origclordid  ModeMsg
highlight link correlationid ModeMsg
highlight link symbol       MoreMsg
highlight link leadingtime  VertSplit
highlight link price        Title
highlight link qty          Title
highlight link side         Title

