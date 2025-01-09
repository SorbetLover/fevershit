var redirectStates:Map<FlxState, String> = [
    TitleState => "FTitle",
    MainMenuState => "FMenu",
    FreeplayState => "FFree"
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys())
        if (Std.isOfType(FlxG.game._requestedState, redirectState))
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}