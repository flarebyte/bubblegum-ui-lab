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

ipsum1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris dolor, suscipit at nulla a, molestie scelerisque lectus. Nullam quis leo a felis auctor mollis ac vel turpis. Praesent eleifend ut sem et hendrerit. Vivamus sagittis tortor ipsum, eu suscipit lectus accumsan a. Vivamus elit ante, ornare vitae sem at, ornare eleifend nibh. Mauris venenatis nunc sit amet leo aliquam, in ornare quam vehicula. Morbi consequat ante sed felis semper egestas. Donec efficitur suscipit ipsum vitae ultrices. Quisque eget vehicula odio. Aliquam vitae posuere mauris. Nulla ac pulvinar felis. Integer odio libero, vulputate in erat in, tristique cursus erat." 
tagWidgetHeader = ("", " Please select a tag")
tagWidget = { header = tagWidgetHeader, selected = tagWidgetHeader,  values = Set.empty , suggestions = ([tagWidgetHeader, ("a", "Aphrodite"), ("b", "Apollo"), ("c", "Ares"), ("d", "Artemis"), ("e", "Athena")] |> Set.fromList) }
inputWidget = { value= "" }
textAreaWidget = { value= "" , editMode = Viewing}
sidePanel = { message = Just ipsum1}

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
