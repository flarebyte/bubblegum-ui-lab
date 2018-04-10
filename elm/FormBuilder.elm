module FormBuilder exposing(createWidgets)

import Html exposing (..)
import Html.Attributes exposing (..)

createWidgets: Html msg
createWidgets  =
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