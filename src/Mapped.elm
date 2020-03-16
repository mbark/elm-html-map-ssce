module Mapped exposing (..)

import Html
    exposing
        ( Html
        , button
        , div
        , text
        )
import Html.Events exposing (onClick)


type alias Model =
    { visible : Bool
    }


init : Model
init =
    { visible = False }


type Msg
    = Show
    | Hide


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Show ->
            ( { model | visible = True }, Cmd.none )

        Hide ->
            ( { model | visible = False }, Cmd.none )


view : Model -> Html Msg
view model =
    div [] [ button [ onClick Show ] [ text "Show" ] ]


viewModal : Model -> Html Msg
viewModal model =
    if model.visible then
        div [] [ button [ onClick Hide ] [ text "Hide 'modal'" ] ]

    else
        text ""
