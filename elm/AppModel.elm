module AppModel exposing(..)

import Set
import FormBuilder exposing(Model)
type alias AppModel = {
   counter: Int
   , formBuilder:  FormBuilder.Model
}

type Msg
    = SetTagValue String

tagWidget = { values = Set.empty , suggestions = ([("a", "Aphrodite"), ("b", "Apollo"), ("c", "Ares"), ("d", "Artemis"), ("e", "Athena")] |> Set.fromList) }

reset: AppModel
reset =
    {
       counter = 1
       , formBuilder = { tagWidget = tagWidget }
    }

