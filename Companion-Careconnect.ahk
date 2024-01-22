
#SingleInstance
BlockInput("SendAndMouse")

sympath_url := "https://sympath.onrender.com"
faaltekst := "Gelieve een ondersteund EPD te openen"


labofile := A_Args[1]
name := IniRead(labofile,"PATIENT","NAME","")
fname := IniRead(labofile,"PATIENT","FNAME","")
rrn := IniRead(labofile,"PATIENT","RRN","")

suffix := "/" . rrn . "/" . name . " " . fname

SGUI := Gui(,"APO")
text := SGUI.AddText("","Aanvraag voor: " . name . " " . fname)
orderbutton := SGUI.AddButton("section xm w100","Nieuwe biopsie")
paporderbutton := SGUI.AddButton("ys w100","Nieuwe pap")
orderbutton.OnEvent("Click", (*) => Run(sympath_url . "/new_order" . suffix))
paporderbutton.OnEvent("Click", (*) => Run(sympath_url . "/new_paporder" . suffix))
SGUI.show()

