module AppNavbar exposing(create, Model)

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

visualButton: String -> String -> Html AppMsg
visualButton label icon =
    p [ class "control" ]
        [ a [ class "button is-primary", href "https://github.com/flarebyte/bubblegum-ui-lab" ]
            [ span [ class "icon" ]
            [ i [ class ("fas " ++ icon) ]
            []
            ]
            , span []
             [ text label ]
              ]
        ]

visualButtonLeft: String -> String -> Html AppMsg
visualButtonLeft label icon =
    a [ class "navbar-item", href "http://flarebyte.com/" ]
        [ span [ class "icon" ]
            [ i [ class ("fas " ++ icon) ]
                []
            ]
            , span []
            [ text label ]
        ]

searchField: Html AppMsg
searchField =
    div [ class "field" ]
        [ p [ class "control has-icons-left has-icons-right" ]
            [ input [ class "input", placeholder "Search documents", type_ "text" ]
                []
            , span [ class "icon is-small is-left" ]
                [ i [ class "fas fa-search" ]
                    []
                ]
            ]
        ]

create: Html AppMsg
create  =
   nav [ class "navbar is-fixed-top is-black" ]
    [ div [ class "navbar-brand" ]
        [ a [ class "navbar-item", href "http://flarebyte.com/" ]
            [ img [ alt "Bubblegum: UI Lab logo", attribute "height" "28", src "http://flairbyte.com/flarebyte/en/png/logo/8/logo-8.png", attribute "width" "112" ]
                []
            ]
        , div [ class "navbar-burger burger", attribute "data-target" "navbarExampleTransparentExample" ]
            [ span []
                []
            , span []
                []
            , span []
                []
            ]
        ]
    , div [ class "navbar-menu", id "navbarExampleTransparentExample" ]
        [ div [ class "navbar-start" ]
            [ visualButtonLeft "Docs" "fa-book"
            , visualButtonLeft "Settings" "fa-cog"
            , visualButtonLeft "Chat" "fa-comments"
            , visualButtonLeft "Help" "fa-question"
            ]
        , div [ class "navbar-end" ]
            [ div [ class "navbar-item" ]
                [ div [ class "field is-grouped" ]
                    [ 
                    searchField
                    , visualButton "Share" "fa-share-square"
                    , visualButton "Account" "fa-user"
                    ]
                ]
            ]
        ]
    ]
