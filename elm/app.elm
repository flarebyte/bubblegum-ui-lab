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
import AppMsg exposing (..)


main =
  Html.beginnerProgram
    { model = AppModel.reset
    , view = view
    , update = update
    }


-- UPDATE

update : AppMsg -> AppModel -> AppModel
update msg model =
  case msg of
    SetTagValue name ->
      { model | status = name }

-- VIEW


view : AppModel -> Html AppMsg
view model =
  section [ class "section" ]
    [ 
      About.appHeader
      , FormBuilder.create model.formBuilder
      , div [class "container"] [ p [] [ text " ... "], p [] [ text model.status] ]
      , About.appFooter
    ]
