module FormBuilder exposing(create, Model, asTagWidgetIn)

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import TagWidget
import InputWidget
import AppMsg exposing (..)

type alias Description  = {
    title: String
    , comment: String
}

type alias Model = {
    tagWidget: TagWidget.Model
    , inputWidget: InputWidget.Model
}

setTagWidget: TagWidget.Model -> Model -> Model
setTagWidget widget model =
    { model | tagWidget = widget}

asTagWidgetIn:  Model-> TagWidget.Model -> Model
asTagWidgetIn  = flip setTagWidget

sideDescription: Description -> Html msg
sideDescription desc =
    article [ class "message" ]
        [ div [ class "message-header" ]
            [ p []
                [ text desc.title ]
            ]
        , div [ class "message-body" ]
            (Markdown.toHtml Nothing desc.comment)
        ]

create: Model -> Html AppMsg
create  model =
    div [ class "container" ]
    [
        div [ class "columns" ]
        [ div [ class "column" ]
            [ div [ class "box" ]
            (
                [ TagWidget.create model.tagWidget ]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
            )
            ] 
        , div [ class "column" ]
            [
            sideDescription 
            { title = "Input Widget"
            , comment = "This is a descriptionw of *Emphasis*, **strong emphasis**, ***both*** widget."
            }
            ]
        ]
    ]