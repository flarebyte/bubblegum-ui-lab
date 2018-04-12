module FormBuilder exposing(createWidgets)

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown

type alias Description  = {
    title: String
    , comment: String
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

inputWidget: Html msg
inputWidget  =
    div [ class "field is-grouped is-grouped-multiline" ]
        [ div [ class "control" ]
            [ div [ class "tags has-addons" ]
                [ a [ class "tag is-link" ]
                    [ text "Technology" ]
                , a [ class "tag is-delete" ]
                    []
                ]
            ]
        , div [ class "control" ]
            [ div [ class "tags has-addons" ]
                [ a [ class "tag is-link" ]
                    [ text "CSS" ]
                , a [ class "tag is-delete" ]
                    []
                ]
            ]
        ]   

createWidgets: Html msg
createWidgets  =
    div [ class "container" ]
    [
        div [ class "columns" ]
        [ div [ class "column" ]
            [ inputWidget ]
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
            [ inputWidget ]
        , div [ class "column" ]
            [
            sideDescription 
            { title = "Input Widget"
            , comment = "This is a descriptionw of *Emphasis*, **strong emphasis**, ***both*** widget."
            }
            ]
        ]
    ]