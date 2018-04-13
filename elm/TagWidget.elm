module TagWidget exposing(create)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Description  = {
    title: String
    , comment: String
}


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

cardHeader:String -> String -> Html msg
cardHeader label description =
    header [ class "card-header" ]
                [ p [ class "card-header-title" ]
                    [ text label ]
                , p [ class "has-text-info" ]
                    [ text description ]
                , a [ attribute "aria-label" "more options", class "card-header-icon", href "#" ]
                    [ span [ class "icon" ]
                        [ i [ attribute "aria-hidden" "true", class "fas fa-question-circle" ]
                            []
                        ]
                ] 
                ]

listItem: String -> Html msg
listItem label =
    option [] 
        [ text label
          , em []
        [ text " Information technology" ] ]

create: Html msg
create  =
    div [ class "card"]
        [   cardHeader "Tags" "Specify 8 tags"
            , div [ class "card-content"]
            [ div [ class "field has-addons" ]
                [ div [ class "control has-icons-left is-expanded" ]
                    [ span [ class "select is-fullwidth" ]
                        [ select []
                            (["S3", "SQS", "SNS", "Cognito", "Elastic Cache", "DynamoDB"] 
                            |> List.map listItem)
                        ]
                     , p [ class "help" ][ text "This is a help text" ]       
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

