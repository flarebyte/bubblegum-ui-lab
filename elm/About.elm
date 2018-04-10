module About
  exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)


appHeader: Html msg
appHeader = 
    div [ class "container" ]
        [ h1 [ class "title" ]
            [ text "Bublegum User interface widgets experiment" ]
        , p [ class "subtitle" ]
            [ text "List of widgets"
            ]
        ]

appFooter : Html msg
appFooter =
    footer [ class "footer" ]
        [ div [ class "container" ]
            [ div [ class "content has-text-centered" ]
                [ p []
                    [ strong []
                        [ text "Bublegum User interface widgets experiment" ]
                    , text " by "
                    , a [ href "https://github.com/olih" ]
                        [ text "Olivier Huin" ]
                    , text ". The source code is licensed under BSD3"
                    ]
                ]
            ]
        ]