module AppSidePanel exposing(create, Model, setMessage)

import Html exposing (..)
import Html.Attributes exposing (..)
import AppMsg exposing (..)
import Markdown


type alias Model = {
    message: Maybe String
 }

setMessage: Maybe String -> Model -> Model
setMessage text model=
    { model | message = text }


createMessage: Maybe String -> Html AppMsg
createMessage  message =
    article [ class "message" ]
        [  div [ class "message-body" ]
            (message |> Maybe.withDefault "" |> Markdown.toHtml Nothing)
        ]

create: Model -> Html AppMsg
create  model =
     div [ class "box fixed" ]
        [ createMessage model.message ]
