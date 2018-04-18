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
import FormBuilder exposing(..)
import TagWidget exposing(..)
import AppNavbar
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
    OnAddTagValue name ->
      selectFromKey name model.formBuilder.tagWidget 
      |> moveSelectedToValues
      |> asTagWidgetIn model.formBuilder
      |> asFormBuilderIn model
    OnDeleteTagValue name ->
      selectFromKey name model.formBuilder.tagWidget 
      |> moveSelectedToSuggestions 
      |> asTagWidgetIn model.formBuilder
      |> asFormBuilderIn model
      

-- VIEW


view : AppModel -> Html AppMsg
view model =
  section [ class "section" ]
    [ 
      AppNavbar.create 
      , div [class "container"] [ p [] [ text " ... "]]
      , FormBuilder.create model.formBuilder
      , div [class "container"] [ p [] [ text " ... "]]
      , About.appFooter
    ]
