module TagWidget exposing(create, Model, moveValueToSuggestions, moveSuggestionToValues)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Set exposing(Set)
import Tuple exposing(first, second)
import AppMsg exposing (..)

type alias Description  = {
    title: String
    , comment: String
}

type alias Model = {
    values: Set (String, String)
    , suggestions: Set (String, String)
}

moveValueToSuggestions: (String, String) -> Model -> Model
moveValueToSuggestions value model =
    { values = Set.remove value model.values 
        , suggestions = Set.insert value model.suggestions
    }

moveSuggestionToValues: (String, String) -> Model -> Model
moveSuggestionToValues value model =
    { values = Set.insert value model.values 
        , suggestions = Set.remove value model.suggestions
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

create: Model -> Html AppMsg
create  model =
    div [ class "card"]
        [   cardHeader "Tags" "Specify 8 tags"
            , div [ class "card-content"]
            [ div [ class "field has-addons" ]
                [ div [ class "control has-icons-left is-expanded" ]
                    [ span [ class "select is-fullwidth" ]
                        [ select [ onInput SetTagValue]
                            (model.suggestions
                            |> Set.toList  
                            |> List.map second
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
            ( model.values
            |> Set.toList
            |> List.map second 
            |> List.map oneTag)
            ]   
    ]       

