module Main exposing (main)

import Browser
import Html
    exposing
        ( Html
        , div
        )
import Mapped
import Platform


main : Platform.Program Flags Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , view = view
        , update = update
        }


type alias Model =
    { mapped : Mapped.Model
    }


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { mapped = Mapped.init }, Cmd.none )


type Msg
    = GotMappedMsg Mapped.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotMappedMsg subMsg ->
            let
                ( mappedModel, mappedMsg ) =
                    Mapped.update subMsg model.mapped
            in
            ( { model | mapped = mappedModel }, Cmd.map GotMappedMsg mappedMsg )


view : Model -> Html Msg
view model =
    div []
        [ Html.map GotMappedMsg <| Mapped.view model.mapped
        , Html.map GotMappedMsg <| Mapped.viewModal model.mapped
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
