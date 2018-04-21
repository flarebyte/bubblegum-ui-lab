module AppModel exposing(..)

import Set
import FormBuilder exposing(Model)
import EditMode exposing(..)
import Maybe

type alias AppModel = {
   counter: Int
   , status: String
   , formBuilder:  FormBuilder.Model
}

tagWidgetHeader = ("", " Please select a tag")
tagWidget = { header = tagWidgetHeader, selected = tagWidgetHeader,  values = Set.empty , suggestions = ([tagWidgetHeader, ("a", "Aphrodite"), ("b", "Apollo"), ("c", "Ares"), ("d", "Artemis"), ("e", "Athena")] |> Set.fromList) }
inputWidget = { value= "" }
textAreaWidget = { value= "" , editMode = Viewing}
sidePanel = { message = Maybe.Nothing}

reset: AppModel
reset =
    {
       counter = 1
       , status = "OK"
       , formBuilder = { tagWidget = tagWidget
            , inputWidget = inputWidget
            , textAreaWidget = textAreaWidget
            , sidePanel = sidePanel
            }
    }

setFormBuilder: FormBuilder.Model -> AppModel -> AppModel
setFormBuilder builder model =
    { model | formBuilder = builder}

asFormBuilderIn:  AppModel-> FormBuilder.Model -> AppModel
asFormBuilderIn  = flip setFormBuilder
