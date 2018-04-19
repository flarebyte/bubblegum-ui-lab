module TextAreaWidget exposing(create, Model, setTextArea, toggleEditMode)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick, onMouseEnter, onMouseOut)
import AppMsg exposing (..)
import String exposing(lines)

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


renderText: Model -> Html AppMsg
renderText model =
    model.value |> lines |> List.map (\line -> p [] [text line]) |> div []

createEdit: Model -> Html AppMsg
createEdit  model =
    div [ class "box is-marginless is-paddingless is-shadowless"]
        [   h4 [] [ text "Description of the feature"]
           , checkEditMode model
           , textarea [ class "textarea is-marginless is-paddingless is-shadowless"
                , placeholder "e.g. Hello world"
                , onInput OnChangeTextArea
                , value model.value
                , attribute "rows" (model.value |> lines |> List.length |> (+) 1 |> toString )
               ]
            [] 
        ]       

createView: Model -> Html AppMsg
createView  model =
    div [ class "box is-marginless is-paddingless is-shadowless", onMouseEnter OnToggleTextAreaEdit ]
        [   h4 [] [ text "Description of the feature"]
            , checkEditMode model
            , renderText model
        ]       

create: Model -> Html AppMsg
create  model =
    if model.editMode then
        createEdit model
    else
        createView model
