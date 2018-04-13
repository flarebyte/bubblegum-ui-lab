module FormBuilder exposing(create, Model)

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import TagWidget

type alias Description  = {
    title: String
    , comment: String
}

type alias Model = {
    tagWidget: TagWidget.Model
}

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

create: Model -> Html msg
create  model =
    div [ class "container" ]
    [
        div [ class "columns" ]
        [ div [ class "column" ]
            [ TagWidget.create model.tagWidget]
        , div [ class "column" ]
            [
            sideDescription 
            { title = "Input Widget"
            , comment = "This is a descriptionw of *Emphasis*, **strong emphasis**, ***both*** widget."
            }
            ]
        ]
        , div [ class "columns" ]
        [ div [ class "column" ]
            [ TagWidget.create model.tagWidget]
        , div [ class "column" ]
            [
            sideDescription 
            { title = "Input Widget"
            , comment = "This is a descriptionw of *Emphasis*, **strong emphasis**, ***both*** widget."
            }
            ]
        ]
    ]