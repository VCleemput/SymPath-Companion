#Include UIA.ahk
#SingleInstance
BlockInput("SendAndMouse")

sympath_url := "https://sympath.onrender.com"
faaltekst := "Gelieve een ondersteund EPD te openen"

SGUI := Gui(,"APO")
clienttext := SGUI.AddText("","EPD: " . _get_client())
orderbutton := SGUI.AddButton("section xm w100","Nieuwe biopsie")
paporderbutton := SGUI.AddButton("ys w100","Nieuwe pap")
orderbutton.OnEvent("Click", (*) => Run(sympath_url . "/new_order" . _get_suffix()))
paporderbutton.OnEvent("Click", (*) => Run(sympath_url . "/new_paporder" . _get_suffix()))
SGUI.show()

_get_client(*)
{
    if WinExist("ahk_execareconnect.exe")
        return "CareConnect"
    return faaltekst
}

_get_suffix(*)
{
    client := _get_client()
    if client = "CareConnect"
    {
        careconnectEI := UIA.ElementFromHandle("CareConnect ahk_exe careconnect.exe")
        name := careconnectEI.ElementFromPath("KrK").Name
        riziv := careconnectEI.ElementFromPath("KyK").Name
        return "/" . riziv . "/" . name
    }
    
}



