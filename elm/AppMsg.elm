module AppMsg exposing(AppMsg(..))
import EditMode exposing(..)

type AppMsg =
    OnAddTagValue String
    | OnDeleteTagValue String
    | OnChangeTextArea String
    | OnToggleTextAreaMode
    | OnValidationError String
    