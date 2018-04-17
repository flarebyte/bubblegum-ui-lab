module InputWidget exposing(create, Model)

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
    value: String
 }


create: Model -> Html AppMsg
create  model =
    div [ class "box"]
            [ div [ class "field" ]
                [ label [ class "label" ]
                    [ text "Label" ]
                , div [ class "control" ]
                    [ input [ class "input", placeholder "Text input", type_ "text" ]
                        []
                    ]
                , p [ class "help" ]
                    [ text "This is a help text" ]
                ]
            
    ]       

