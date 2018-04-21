module About
  exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)

footerLevel: Html msg
footerLevel =
    nav [ class "navbar is-transparent" ]
        [ div [ class "navbar-brand" ]
            [ a [ class "navbar-item", href "https://bulma.io" ]
                [ img [ alt "Bulma: a modern CSS framework based on Flexbox", attribute "height" "28", src "https://bulma.io/images/bulma-logo.png", attribute "width" "112" ]
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
                [ a [ class "navbar-item", href "https://bulma.io/" ]
                    [ text "Home      " ]
                , div [ class "navbar-item has-dropdown is-hoverable" ]
                    [ a [ class "navbar-link", href "/documentation/overview/start/" ]
                        [ text "Docs        " ]
                    , div [ class "navbar-dropdown is-boxed" ]
                        [ a [ class "navbar-item", href "/documentation/overview/start/" ]
                            [ text "Overview          " ]
                        , a [ class "navbar-item", href "https://bulma.io/documentation/modifiers/syntax/" ]
                            [ text "Modifiers          " ]
                        , a [ class "navbar-item", href "https://bulma.io/documentation/columns/basics/" ]
                            [ text "Columns          " ]
                        , a [ class "navbar-item", href "https://bulma.io/documentation/layout/container/" ]
                            [ text "Layout          " ]
                        , a [ class "navbar-item", href "https://bulma.io/documentation/form/general/" ]
                            [ text "Form          " ]
                        , hr [ class "navbar-divider" ]
                            []
                        , a [ class "navbar-item", href "https://bulma.io/documentation/elements/box/" ]
                            [ text "Elements          " ]
                        , a [ class "navbar-item is-active", href "https://bulma.io/documentation/components/breadcrumb/" ]
                            [ text "Components          " ]
                        ]
                    ]
                ]
            , div [ class "navbar-end" ]
                [ div [ class "navbar-item" ]
                    [ div [ class "field is-grouped" ]
                        [ p [ class "control" ]
                            [ a [ class "bd-tw-button button", attribute "data-social-action" "tweet", attribute "data-social-network" "Twitter", attribute "data-social-target" "http://localhost:4000", href "https://twitter.com/intent/tweet?text=Bulma: a modern CSS framework based on Flexbox&hashtags=bulmaio&url=http://localhost:4000&via=jgthms", target "_blank" ]
                                [ span [ class "icon" ]
                                    [ i [ class "fab fa-twitter" ]
                                        []
                                    ]
                                , span []
                                    [ text "Tweet              " ]
                                ]
                            ]
                        , p [ class "control" ]
                            [ a [ class "button is-primary", href "https://github.com/jgthms/bulma/releases/download/0.7.0/bulma-0.7.0.zip" ]
                                [ span [ class "icon" ]
                                    [ i [ class "fas fa-download" ]
                                        []
                                    ]
                                , span []
                                    [ text "Download" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
appFooter : Html msg
appFooter =
    footerLevel