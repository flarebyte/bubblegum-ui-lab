module AppMsg exposing(AppMsg(..))

type AppMsg
    = SetTagValue String
    | OnAddTagValue
    | OnDeleteTagValue String