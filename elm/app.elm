module App
  exposing(..)
{-| App

# Basics
@docs

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import About as About
import AppModel exposing (..)
import FormBuilder


main =
  Html.beginnerProgram
    { model = AppModel.reset
    , view = view
    , update = update
    }


-- UPDATE

update : Msg -> AppModel -> AppModel
update msg model =
  case msg of
    SetTagValue name ->
      model

-- VIEW


view : AppModel -> Html Msg
view model =
  section [ class "section" ]
    [ 
      About.appHeader
      , FormBuilder.create model.formBuilder
      , div [class "container"] [ p [] [ text " ... "] ]
      , About.appFooter
    ]
