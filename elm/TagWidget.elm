module TagWidget exposing(create, Model, selectFromKey, moveSelectedToSuggestions, moveSelectedToValues)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Set exposing(Set)
import Tuple exposing(first, second)
import AppMsg exposing (..)

type alias Description  = {
    title: String
    , comment: String
}

type alias Model = {
    header: (String, String)
    , selected: (String, String)
    , values: Set (String, String)
    , suggestions: Set (String, String)
}


moveSelectedToSuggestions:  Model -> Model
moveSelectedToSuggestions model =
    if model.selected == model.header then
        model
    else    
        { model |
            values = Set.remove model.selected model.values 
            , suggestions = Set.insert model.selected model.suggestions
        }

moveSelectedToValues:  Model -> Model
moveSelectedToValues model =
    if model.selected == model.header then
        model
    else    
        {   model | 
            values = Set.insert model.selected model.values 
            , suggestions = Set.remove model.selected model.suggestions
        }

selectFromKey: String -> Model -> Model
selectFromKey key model =
    let
        selected = Set.union model.values model.suggestions |> Set.filter (\kv -> first kv == key) |> Set.toList |> List.head |> Maybe.withDefault ("?", "?")
    in
        { model | selected = selected }



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

listItem: (String, String) -> Html msg
listItem item =
    option [value (first item)] 
        [ text (second item) ]

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
                            |> List.map listItem)
                        ]
                     , p [ class "help" ][ text "This is a help text" ]       
                    , span [ class "icon is-small is-left" ]
                        [ i [ class "fas fa-tags" ]
                            []
                        ]
                    ]
                , div [ class "control" ]
                    [ button [ onClick OnAddTagValue, class "button is-primary", type_ "submit" ]
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

