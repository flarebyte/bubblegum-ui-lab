module AppMsg exposing(AppMsg(..))

type AppMsg =
    OnAddTagValue String
    | OnDeleteTagValue String
    | OnChangeTextArea String
    | OnToggleTextAreaEdit