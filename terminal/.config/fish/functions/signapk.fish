function signapk --description 'Sign APK with personal keystore'
    if test (count $argv) -ne 1
        echo "signapk: missing path to APK"
        exit 1
    end
    set FILENAME $argv[1]
    # Find apksigner from Android SDK
    set APKSIGNER (find "$ANDROID_HOME"/build-tools/ -name apksigner | sort -r)[1]

    # Read master password to determine keystore and key password
    echo -n "Enter master password: "
    read -s -p "" MPW

    # Read keystore and key password with mpw
    set KEYSTORE_PASS (printf "$MPW" | /usr/bin/mpw -m - Maxr1998_KeyStore 2> /dev/null | tr -d "\n")
    set KEY_PASS (printf "$MPW" | /usr/bin/mpw -m - Maxr1998_Key 2> /dev/null | tr -d "\n")
    set -e MPW

    # Sign the APK file
    $APKSIGNER sign --ks ~/Development/Maxr1998_key.jks --ks-pass "pass:$KEYSTORE_PASS" --key-pass "pass:$KEY_PASS" $FILENAME
    set -e KEYSTORE_PASS
    set -e KEY_PASS
end
