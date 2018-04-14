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
      selectFromKey name model.formBuilder.tagWidget 
      |> asTagWidgetIn model.formBuilder
      |> asFormBuilderIn model
    OnAddTagValue ->
      moveSelectedToValues model.formBuilder.tagWidget 
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
      About.appHeader
      , FormBuilder.create model.formBuilder
      , div [class "container"] [ p [] [ text " ... "], p [] [ text (Tuple.second model.formBuilder.tagWidget.selected)] ]
      , About.appFooter
    ]
