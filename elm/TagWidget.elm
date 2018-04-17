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



oneTag: (String, String) -> Html AppMsg
oneTag item =
    div [ class "control" ]
                    [ div [ class "tags has-addons" ]
                        [ span [ class "tag is-primary"
                        , attribute "data-balloon" "Athena, goddess of wisdom. Though Hercules had an enemy, Hera, on Mount Olympus, he also had a friend. ... Athena, the goddess of wisdom and military victory, and also the patron of the city of Athens, was Hercules' half-sister. Her parents were Zeus and Metis, a nymph."
                        , attribute "data-balloon-pos" "up"
                        , attribute "data-balloon-length" "large"]
                            [ text (second item) ]
                        , button [ class "tag is-delete", onClick (OnDeleteTagValue (first item)) ]
                            []
                        ]
                    ]

cardHeader:String -> String -> Html msg
cardHeader label description =
    header [ class "card-header" ]
                [ p [ class "card-header-title" ]
                    [ text label ]
                , p [ attribute "aria-label" "more options"
                    , class "card-header-icon"
                    , attribute "data-balloon-pos" "up"
                    , attribute "data-balloon-length" "large"
                     , attribute "data-balloon" description
                    ]
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
        [   cardHeader "Tags" "Tags describing some features of the application."
            , div [ class "card-content"]
            [ div [ class "field has-addons" ]
                [ div [ class "control has-icons-left is-expanded" ]
                    [ span [ class "select is-fullwidth" ]
                        [ select [ onInput OnAddTagValue]
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
                ]
            , div [ class "field is-grouped is-grouped-multiline" ]
            ( model.values
            |> Set.toList
            |> List.map oneTag)
            ]   
    ]       

