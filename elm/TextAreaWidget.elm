module TextAreaWidget exposing(create, Model, setTextArea, toggleMode)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick, onMouseEnter, onMouseOut)
import String exposing(lines)
import List
import AppMsg exposing (..)
import EditMode exposing(..)

type alias Model = {
    value: String
    , editMode: EditMode
 }

ipsum1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris dolor, suscipit at nulla a, molestie scelerisque lectus. Nullam quis leo a felis auctor mollis ac vel turpis. Praesent eleifend ut sem et hendrerit. Vivamus sagittis tortor ipsum, eu suscipit lectus accumsan a. Vivamus elit ante, ornare vitae sem at, ornare eleifend nibh. Mauris venenatis nunc sit amet leo aliquam, in ornare quam vehicula. Morbi consequat ante sed felis semper egestas. Donec efficitur suscipit ipsum vitae ultrices. Quisque eget vehicula odio. Aliquam vitae posuere mauris. Nulla ac pulvinar felis. Integer odio libero, vulputate in erat in, tristique cursus erat." 
ipsum2 = "Pellentesque vel aliquam diam. Pellentesque tincidunt posuere libero at congue. Praesent vitae est ex. Cras mauris felis, sollicitudin eu quam non, rhoncus bibendum lectus. Nam id mattis est. Pellentesque pellentesque est elit, sed maximus massa sagittis in. Nullam non blandit neque, sed facilisis turpis. Fusce purus orci, auctor at posuere vel, pharetra at leo. Sed semper nec leo sed hendrerit. Quisque sollicitudin et dui in cursus. Donec vel libero feugiat, iaculis felis ac, condimentum metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla facilisi. Vestibulum iaculis mauris enim, cursus tincidunt velit aliquet sit amet. Maecenas ac mauris auctor, sollicitudin ante id, suscipit magna. Cras vel magna eget mauris sollicitudin suscipit in nec ipsum."

defaultModel: Model
defaultModel = {
   value = ipsum1 ++ "\n" ++ ipsum2
   , editMode = Viewing 
 }

type alias Config = {
    id: Int
    , title: String
 }

configs: List Config
configs = [
     {id = 1, title = "Description of the feature 1"}
     , {id = 2, title = "Description of the feature 2"}
     , {id = 3, title = "Description of the feature 3"}
     , {id = 4, title = "Description of the feature 4"}
 ]

getConfig: Int -> Config
getConfig id =
    configs |> List.filter (\i -> i.id == id) |> List.head |> Maybe.withDefault {id = 1, title = "Description of the feature"}

shouldUseDefaultModel: Int -> Bool
shouldUseDefaultModel id = id > 1

setTextArea: String -> Model -> Model
setTextArea text model=
    { model | value = text }

toggleMode: EditMode -> Model -> Model
toggleMode mode model=
    { model | editMode = mode }

smallIcon: String -> List (Html AppMsg)
smallIcon iconId=
    [ span [ class "icon is-small" ]
        [ i [ class ("fas " ++ iconId) ]
            []
        ]
    ]

editModeToClass:  EditMode -> String -> String -> EditMode -> String
editModeToClass expected whenExpected otherwise actual  =
    if actual == expected then
        whenExpected
    else
        otherwise

editModeToString: EditMode -> String
editModeToString mode =
    case mode of
        Viewing -> "Viewing"
        Editing -> "Editing"
        Suggesting -> "Suggesting"

checkEditMode: Model -> Html AppMsg
checkEditMode model =
    span [ class "buttons" ]
        [ button [ class (editModeToClass Viewing "button is-success is-selected is-small" "button is-small" model.editMode) , onClick (OnToggleTextAreaMode Viewing) ]
            (smallIcon  "fa-eye")
        , button [ class (editModeToClass Editing "button is-success is-selected is-small" "button is-small" model.editMode), onClick (OnToggleTextAreaMode Editing) ]
            (smallIcon  "fa-edit")
        , button [ class (editModeToClass Suggesting "button is-success is-selected is-small" "button is-small" model.editMode), onClick (OnToggleTextAreaMode Suggesting) ]
            (smallIcon "fa-check")
        ]

renderText: Model -> Html AppMsg
renderText model =
    model.value |> lines |> List.map (\line -> p [] [text line]) |> div []

createEdit: Model -> Int -> Html AppMsg
createEdit  model id =
    div [ class "box is-marginless is-paddingless is-shadowless has-addons"]
        [  h4 [ class "title is-4" ] [ text (getConfig id|> .title)]
           , textarea [ class "textarea is-marginless is-paddingless is-shadowless"
                , placeholder "e.g. Hello world"
                , onInput OnChangeTextArea
                , value model.value
                , attribute "rows" (model.value |> lines |> List.length |> (+) 1 |> toString )
               ]
            [] 
        ]       

createView: Model -> Int -> Html AppMsg
createView  model id =
    div [ class "box is-marginless is-paddingless is-shadowless has-addons"
         -- , onMouseEnter OnToggleTextAreaEditing
        ]
        [ h4 [ class "title is-4" ] [ text (getConfig id|> .title)]
            , renderText model
        ]       

createContent: Model -> Int -> Html AppMsg
createContent  model id=
    if shouldUseDefaultModel id then
        createView defaultModel id
    else if model.editMode == Editing then
        createEdit model id
    else
        createView model id


create: Model -> Int -> Html AppMsg
create  model id=
    div [ class "columns" ]
    [ div [ class "column" ]
        [createContent model id]
    , div [ class "column is-1" ]
        [ checkEditMode model ]
    ]