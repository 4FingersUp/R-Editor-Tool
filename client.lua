RegisterCommand('cc:toggleRecording', function()
    if not IsRecording() then
        StartRecording(1)
    else
        StopRecordingAndSaveClip()
    end
end, false)

RegisterCommand('cc:discardRecording', function()
    if IsRecording() then
        StopRecordingAndDiscardClip()
    end
end, false)

local confirm = true
RegisterCommand('cc:openRockstarEditor', function()
    if confirm then
        exports['id_notify']:notify({
            title = 'Føtex - Tool',
            message = 'Do you want to leave the server and open the R* Editor?<br>If yes, press the button again.',
            type = 'info'
        })
        confirm = false
        Citizen.Wait(25 * 1000)
        if not confirm then confirm = true end
    else
        NetworkSessionLeaveSinglePlayer()
        ActivateRockstarEditor()
        confirm = true
    end
end, false)

RegisterKeyMapping('cc:toggleRecording', 'Start Recording', 'keyboard', Config.DefaultKeys.toggleRecording)
RegisterKeyMapping('cc:discardRecording', 'Stop Recording', 'keyboard', Config.DefaultKeys.discardRecording)
RegisterKeyMapping('cc:openRockstarEditor', 'Open R* Editor', 'keyboard', Config.DefaultKeys.openRockstarEditor)