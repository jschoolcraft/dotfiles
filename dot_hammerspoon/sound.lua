-- Avoid automatically setting a bluetooth audio input device

lastSetDeviceTime = os.time()
lastInputDevice = nil

function audioDeviceChanged(arg)
    if arg == 'dev#' then
        lastSetDeviceTime = os.time()
    elseif arg == 'dIn ' and os.time() - lastSetDeviceTime < 2 then
        inputDevice = hs.audiodevice.defaultInputDevice()
        if inputDevice:transportType() == 'Bluetooth' then
            internalMic = lastInputDevice or hs.audiodevice.findInputByName('Yeti Stereo Microphone')
            internalMic:setDefaultInputDevice()
        end
    end
    if hs.audiodevice.defaultInputDevice():transportType() ~= 'Bluetooth' then
        lastInputDevice = hs.audiodevice.defaultInputDevice()
    end
end

hs.audiodevice.watcher.setCallback(audioDeviceChanged)
hs.audiodevice.watcher.start()
