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

oneTag: String -> Html msg
oneTag label =
    div [ class "control" ]
                    [ div [ class "tags has-addons" ]
                        [ a [ class "tag is-link" ]
                            [ text label ]
                        , a [ class "tag is-delete" ]
                            []
                        ]
                    ]

cardHeader:String -> Html msg
cardHeader label =
    header [ class "card-header" ]
                [ p [ class "card-header-title" ]
                    [ text label ]
                ]

listItem: String -> Html msg
listItem label =
    option [] 
        [ text label
          , em []
        [ text " Information technology" ] ]

tagsWidget: Html msg
tagsWidget  =
    div [ class "card"]
        [   cardHeader "Tags"
            , div [ class "card-content"]
            [ div [ class "field has-addons" ]
                [ div [ class "control has-icons-left is-expanded" ]
                    [ span [ class "select is-fullwidth" ]
                        [ select []
                            (["S3", "SQS", "SNS", "Cognito", "Elastic Cache", "DynamoDB"] 
                            |> List.map listItem)
                        ]
                    , span [ class "icon is-small is-left" ]
                        [ i [ class "fas fa-tags" ]
                            []
                        ]
                    ]
                , div [ class "control" ]
                    [ button [ class "button is-primary", type_ "submit" ]
                        [ text "Add" ]
                    ] 
                ]
            , div [ class "field is-grouped is-grouped-multiline" ]
            (["S3", "SQS", "SNS", "Cognito", "Elastic Cache", "DynamoDB"] |> List.map oneTag)
            ]   
    ]       

createWidgets: Html msg
createWidgets  =
    div [ class "container" ]
    [
        div [ class "columns" ]
        [ div [ class "column" ]
            [ tagsWidget ]
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
            [ tagsWidget ]
        , div [ class "column" ]
            [
            sideDescription 
            { title = "Input Widget"
            , comment = "This is a descriptionw of *Emphasis*, **strong emphasis**, ***both*** widget."
            }
            ]
        ]
    ]