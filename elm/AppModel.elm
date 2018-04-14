module AppModel exposing(..)

import Set
import FormBuilder exposing(Model)
type alias AppModel = {
   counter: Int
   , status: String
   , formBuilder:  FormBuilder.Model
}

tagWidget = { values = Set.empty , suggestions = ([("a", "Aphrodite"), ("b", "Apollo"), ("c", "Ares"), ("d", "Artemis"), ("e", "Athena")] |> Set.fromList) }

reset: AppModel
reset =
    {
       counter = 1
       , status = "OK"
       , formBuilder = { tagWidget = tagWidget }
    }

setFormBuilder: FormBuilder.Model -> AppModel -> AppModel
setFormBuilder builder model =
    { model | formBuilder = builder}

asFormBuilderIn:  AppModel-> FormBuilder.Model -> AppModel
asFormBuilderIn  = flip setFormBuilder
