module FormBuilder exposing(create, Model, asTagWidgetIn, asTextAreaWidgetIn, asAppSidePanelIn)

import Html exposing (..)
import Html.Attributes exposing (..)
import TagWidget
import InputWidget
import TextAreaWidget
import AppSidePanel
import AppMsg exposing (..)

type alias Model = {
    tagWidget: TagWidget.Model
    , inputWidget: InputWidget.Model
    , textAreaWidget: TextAreaWidget.Model
    , sidePanel: AppSidePanel.Model
}

setTagWidget: TagWidget.Model -> Model -> Model
setTagWidget widget model =
    { model | tagWidget = widget}

asTagWidgetIn:  Model-> TagWidget.Model -> Model
asTagWidgetIn  = flip setTagWidget

setTextAreaWidget: TextAreaWidget.Model -> Model -> Model
setTextAreaWidget widget model =
    { model | textAreaWidget = widget}

asTextAreaWidgetIn:  Model-> TextAreaWidget.Model -> Model
asTextAreaWidgetIn  = flip setTextAreaWidget

setAppSidePanel: AppSidePanel.Model -> Model -> Model
setAppSidePanel panel model =
    { model | sidePanel = panel}

asAppSidePanelIn:  Model-> AppSidePanel.Model -> Model
asAppSidePanelIn  = flip setAppSidePanel


create: Model -> Html AppMsg
create  model =
    div [ class "container" ]
    [
        div [ class "columns" ]
        [ div [ class "column is-three-quarters" ]
            [ div [ class "box" ]
            (
                [ TagWidget.create model.tagWidget ]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [TextAreaWidget.create model.textAreaWidget 1]
                 ++ [TextAreaWidget.create model.textAreaWidget 2]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [TextAreaWidget.create model.textAreaWidget 3]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
                 ++ [InputWidget.create model.inputWidget]
            )
            ] 
        , div [ class "column" ]
            [
            AppSidePanel.create model.sidePanel
            ]
        ]
    ]