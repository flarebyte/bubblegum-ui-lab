module TextAreaWidget exposing(create, Model, setTextArea, toggleEditMode)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import AppMsg exposing (..)

type alias Model = {
    value: String
    , editMode: Bool
 }

setTextArea: String -> Model -> Model
setTextArea text model=
    { model | value = text }

toggleEditMode: Model -> Model
toggleEditMode model=
    { model | editMode = not model.editMode }


checkEditMode: Model -> Html AppMsg
checkEditMode model =
    button [ class "button" , onClick OnToggleTextAreaEdit]
        [ span [ class "icon is-small" ]
            [ i [ class "fas fa-edit" ]
                []
            ]
        ]

createEdit: Model -> Html AppMsg
createEdit  model =
    div [ class "box is-marginless is-paddingless is-shadowless"]
        [   h4 [] [ text "Description of the feature"]
           , checkEditMode model
           , textarea [ class "textarea"
                , placeholder "e.g. Hello world"
                , onInput OnChangeTextArea
                , value model.value
               ]
            [] 
        ]       

createView: Model -> Html AppMsg
createView  model =
    div [ class "box is-marginless is-paddingless is-shadowless"]
        [   h4 [] [ text "Description of the feature"]
            , checkEditMode model
            , p [] [ text model.value ]
        ]       

create: Model -> Html AppMsg
create  model =
    if model.editMode then
        createEdit model
    else
        createView model
