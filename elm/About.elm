module About
  exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)

footerLevel: Html msg
footerLevel =
    nav [ class "level" ]
        [ div [ class "level-item has-text-centered" ]
            [ div []
                [ p [ class "heading" ]
                    [ text "Tweets" ]
                , p [ class "title" ]
                    [ text "3,456" ]
                ]
            ]
        , div [ class "level-item has-text-centered" ]
            [ div []
                [ p [ class "heading" ]
                    [ text "Following" ]
                , p [ class "title" ]
                    [ text "123" ]
                ]
            ]
        , div [ class "level-item has-text-centered" ]
            [ div []
                [ p [ class "heading" ]
                    [ text "Followers" ]
                , p [ class "title" ]
                    [ text "456K" ]
                ]
            ]
        , div [ class "level-item has-text-centered" ]
            [ div []
                [ p [ class "heading" ]
                    [ text "Likes" ]
                , p [ class "title" ]
                    [ text "789" ]
                ]
            ]
        ]

appFooter : Html msg
appFooter =
    footerLevel